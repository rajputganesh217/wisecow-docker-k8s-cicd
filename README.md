# Wisecow Application: Containerization, Kubernetes Deployment & Health Monitoring

## Project Overview

This project demonstrates the **containerization and deployment** of the **Wisecow application** on a Kubernetes environment with an automated **CI/CD pipeline** using **GitHub Actions**. Additionally, the project includes scripts for **system health monitoring** and **application health checking**.

---

## Features

### 1. Dockerization
- The Wisecow application is packaged into a **Docker image**.
- Base image: `Ubuntu 22.04`
- Dependencies installed: `fortune`, `cowsay`, `netcat-traditional`
- Exposes port `4499` for application access.

### 2. Kubernetes Deployment
- Deployment YAML for Wisecow app with **replica management**.
- Service YAML exposing the application via **NodePort**.
- Optional **Ingress** YAML for secure TLS access (requires NGINX Ingress Controller and Cert-Manager).

### 3. CI/CD Pipeline (GitHub Actions)
- Builds and pushes Docker image to **Docker Hub** on every commit to the `main` branch.
- Deploys updated image to Kubernetes automatically.
- Self-hosted runner on EC2 configured for CI/CD.

### 4. Health Monitoring Scripts
#### a) System Health Monitoring
- Checks CPU usage, memory usage, disk space, and top running processes.
- Alerts logged if metrics exceed predefined thresholds.
- Logs saved to `system_health.log`.

#### b) Application Health Checker
- Checks uptime of the Wisecow app via HTTP request.
- Logs status as `UP` or `DOWN` in `app_health.log`.
- Useful for automated monitoring or cron jobs.

---

## Repository Structure

