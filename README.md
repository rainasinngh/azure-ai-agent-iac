# Agentic AI Infrastructure (IaC)

This repository contains the **Infrastructure as Code (IaC)** implementation for deploying a **secure, production-grade AI agent platform** on **Microsoft Azure** using **Azure Container Apps**.

The project demonstrates **modular ARM template design**, secure access patterns, and automated infrastructure deployment aligned with real-world enterprise cloud practices.

---

## ⚙️ Prerequisites

The following prerequisites **must be completed before using this repository**:

- An active **Azure account**
- A valid **Azure subscription**
- **Contributor** role access on the subscription
- A pre-existing **Virtual Network** with:
  - **1 public subnet**
  - **3 private subnets**
- A **Private DNS Zone** linked to the Virtual Network
- A **dummy SSL certificate** available locally (used for Application Gateway configuration)
- **Azure CLI** installed and authenticated
- Bash-compatible shell environment (Linux/macOS or WSL)

> **Important Note:**  
> Networking resources such as **VNets, subnets, and Private DNS** are intentionally **excluded from this repository**.  
> This mirrors enterprise environments where networking is provisioned and governed separately by platform or network teams.

---

## 🏗 Architecture Overview

The infrastructure is designed with **minimal public exposure** and **strong security boundaries**:

- **Application Gateway** acts as the only public entry point
- All backend services have **public access disabled**
- Containerized workloads run on **Azure Container Apps**
- Persistent data is stored in **Azure SQL Database** and **Blob Storage**
- Logs and metrics are centralized using **Azure Log Analytics**

---

## 📁 Repository Structure

```text
agentic-infra/
├── modules/
│   ├── containers/
│   │   ├── parameters/
│   │   │   ├── acr-params.json
│   │   │   ├── cae-params.json
│   │   │   └── container-apps-params.json
│   │   ├── acr.json
│   │   ├── cae.json
│   │   └── container-apps.json
│   ├── database/
│   │   ├── parameters/
│   │   │   ├── blob-params.json
│   │   │   └── db-params.json
│   │   ├── blob-storage.json
│   │   └── db.json
│   ├── gateway/
│   └── monitoring/
│       ├── parameters/
│       │   └── logs-params.json
│       └── log-analytics.json
├── azure-main.yml
├── deploy-infra.sh
└── README.md
