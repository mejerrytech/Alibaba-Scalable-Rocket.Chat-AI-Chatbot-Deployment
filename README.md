# 🤖 Alibaba Cloud Rocket.Chat AI Chatbot Deployment using Terraform

This project automates the deployment of a scalable **Rocket.Chat AI chatbot** on **Alibaba Cloud ECS (Elastic Compute Service)** using **Terraform** and **Docker Compose**.

---

## 📦 Project Structure


---

## 🧰 Technologies Used

- **Alibaba Cloud ECS**: Virtual machines to host Rocket.Chat and chatbot
- **Terraform**: Infrastructure as Code tool to provision cloud resources
- **Docker Compose**: Simplified container management for Rocket.Chat and chatbot
- **Rocket.Chat**: Open-source chat platform
- **AI/NLP Engine**: Any integrated chatbot logic (e.g., GPT API, Rasa, etc.)

---

## 🚀 Deployment Steps

### 1. Clone the Repository

git clone https://github.com/your-org/Alibaba-Scalable-Rocket.Chat-AI-Chatbot-Deployment.git
cd Alibaba-Scalable-Rocket.Chat-AI-Chatbot-Deployment

---
##2. Configure Terraform Variables

Edit terraform.tfvars to set your Alibaba Cloud configuration:

region       = "cn-beijing"
access_key   = "your_access_key"
secret_key   = "your_secret_key"
instance_type = "ecs.g6.large"


##3. Initialize and Apply Terraform
terraform init
terraform plan
terraform apply


###Outputs

Terraform will show:

    ECS Public IP Address

    Rocket.Chat access URL: http://<public-ip>:3000
