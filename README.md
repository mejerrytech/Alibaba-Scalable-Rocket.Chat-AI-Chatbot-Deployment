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
---
### 2. Initialize Terraform

terraform init


### 3. Plan Infrastructure


terraform plan


### 4. Apply Infrastructure

terraform apply




### 5. Outputs

Terraform will show:

    ECS Public IP Address

    Rocket.Chat access URL: http://<public-ip>:3000
