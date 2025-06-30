terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.244.0"
    }
  }
}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

data "alicloud_zones" "available" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "rocket_vpc" {
  vpc_name   = "rocket-vpc"
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "rocket_vswitch" {
  vswitch_name = "rocket-vswitch"
  cidr_block   = cidrsubnet(var.vpc_cidr, 8, 1)
  vpc_id       = alicloud_vpc.rocket_vpc.id
  zone_id      = data.alicloud_zones.available.zones[0].id
}

resource "alicloud_security_group" "rocket_sg" {
  vpc_id              = alicloud_vpc.rocket_vpc.id
  security_group_name = "rocket-sg"
}

resource "alicloud_security_group_rule" "allow_common_ports" {
  for_each = toset(["22", "80", "443", "3000", "5005"])

  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "${each.value}/${each.value}"
  priority          = 1
  security_group_id = alicloud_security_group.rocket_sg.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_instance" "rocket_ecs" {
  instance_name              = "rocket-ecs"
  instance_type              = var.ecs_instance_type
  image_id                   = var.image_id
  vswitch_id                 = alicloud_vswitch.rocket_vswitch.id
  security_groups            = [alicloud_security_group.rocket_sg.id]
  system_disk_category       = "cloud_essd"
  system_disk_size           = 100
  internet_max_bandwidth_out = 20
  password                   = var.ecs_password
  allocate_public_ip         = true
}

resource "null_resource" "setup_docker_compose" {
  depends_on = [alicloud_instance.rocket_ecs]

  connection {
    type     = "ssh"
    user     = "root"
    password = var.ecs_password
    host     = alicloud_instance.rocket_ecs.public_ip
  }

  # Create target directory before uploading file
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /opt/rocket-chat"
    ]
  }

  # Upload docker-compose.yml to the server
  provisioner "file" {
    source      = "${path.module}/docker-compose.yml"
    destination = "/opt/rocket-chat/docker-compose.yml"
  }

  # Install Docker, run Compose
  provisioner "remote-exec" {
    inline = [
      "apt update -y",
      "apt install -y docker.io docker-compose",
      "systemctl start docker",
      "systemctl enable docker",
      "cd /opt/rocket-chat && docker-compose up -d"
    ]
  }
}
