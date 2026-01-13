# Azure AI Agent Infrastructure & Deployment (IaC)

This repository contains the **Infrastructure as Code (IaC)** and deployment configuration for a **secure, production-grade AI agent application** deployed on **Microsoft Azure** using **Azure Container Apps**.

The project demonstrates real-world cloud architecture, security best practices, and CI/CD automation using Azure-native services.

---

## 🏗 Architecture Overview

The solution is designed with **security and restricted public access** as core principles:

- **Application Gateway** is the only public entry point
- All backend services have **public access disabled**
- Containerized workloads are deployed using **Azure Container Apps**

### Key Components
- Azure Application Gateway  
- Azure Container Apps Environment (CAE)  
- Azure Container Apps  
- Azure Container Registry (ACR)  
- Azure SQL Server & Database  
- Azure Blob Storage  
- Azure Log Analytics Workspace  

---

## 🚀 Features

- Infrastructure provisioning using **ARM templates**
- Secure, production-ready Azure architecture
- Containerized application deployment using **Azure Container Apps**
- Automated **CI/CD pipeline with Azure DevOps**
- Service principal–based authentication
- Centralized logging and monitoring

---

## 🔧 Tech Stack

- **Cloud:** Microsoft Azure  
- **IaC:** ARM Templates  
- **Containers:** Docker, Azure Container Apps  
- **CI/CD:** Azure DevOps Pipelines  
- **Networking & Access:** Application Gateway  
- **Security:** Service Principal, Restricted Public Access  
- **Monitoring:** Azure Log Analytics  

---

## 📁 Repository Structure

```text
.
├── agentic/
│   ├── acr.json
│   ├── container-apps.json
│   ├── app-gateway.json
│   ├── sql-and-storage.json
│   └── log-analytics.json
├── pipelines/
│   └── azure-pipelines.yml
├── diagrams/
│   └── architecture.png
└── README.md
