# 🚀 Strapi CI/CD with GitHub Actions + Terraform + AWS ECR

## 📌 Overview

This project automates deployment of a Strapi app using:

* Docker
* AWS ECR
* GitHub Actions
* Terraform
* EC2

Pipeline Flow:

1. Push code → Build Docker image
2. Push image to AWS ECR
3. Trigger Terraform manually
4. Deploy container on EC2

---

## 🧰 Tech Stack

* Strapi
* Docker
* AWS ECR
* Terraform
* GitHub Actions

---

## 📁 Project Structure

```
.
├ app/
├ terraform/
└ .github/workflows/
```

---

## ⚙️ CI Pipeline

Runs on push to main:

* Builds Docker image
* Authenticates with AWS
* Pushes image to ECR

File:

```
.github/workflows/ci.yml
```

---

## 🚀 CD Pipeline

Manual deployment using Terraform:

* Creates EC2 instance
* Installs Docker
* Pulls image from ECR
* Runs container

File:

```
.github/workflows/terraform.yml
```

---

## 🔐 GitHub Secrets Required

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION
* AWS_ACCOUNT_ID

---

## ☁️ Terraform Infrastructure

Creates:

* EC2 instance
* Docker runtime
* Strapi container deployment

---

## ▶️ How to Deploy

1. Push code to main branch
2. CI builds and pushes image
3. Run Terraform workflow manually
4. Copy EC2 public IP
5. Open in browser

---

## 🌐 Access Application

```
http://<EC2-PUBLIC-IP>
```

---

## 🧠 Learnings

* End-to-end CI/CD automation
* Docker + ECR integration
* Infrastructure as Code using Terraform
* GitHub Actions pipelines

---

## 📌 Future Improvements

* Auto deploy on image update
* Load balancer integration
* HTTPS with ACM
* Auto scaling
