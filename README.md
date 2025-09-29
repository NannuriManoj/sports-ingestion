# Sports Highlights Ingestion & Processing Pipeline

## Overview

The **Sports Highlights Ingestion & Processing Pipeline** is a fully automated system designed to fetch sports highlights from RapidAPI, and store results in Amazon S3. The pipeline runs inside a Docker container on an EC2 instance and can be scheduled using EventBridge.  

This repository includes the Terraform infrastructure code, Python scripts for data ingestion, and Docker configuration for deploying the pipeline.

---

## Features

- Fetches sports highlights from RapidAPI.  
- Supports configurable league and date inputs.  
- Stores highlights metadata in S3 as JSON:  
  `highlights/basketball_highlights.json`  
- Downloads videos from the metadata and saves them in S3 (`videos/`).  
- Dockerized for easy deployment.  
- Infrastructure provisioned with Terraform (S3 buckets, EC2, ECR).  

> **Note:** MediaConvert configuration and EventBridge scheduling can be added as the next steps.

---

## Project Structure
sports-ingestion/
│
├── terraform/
│ ├── s3.tf 
│ ├── ec2.tf 
│ └── ecr.tf 
│
├── app/
│ ├── pipeline.py
│ ├── requirements.txt 
│ └── .env
| |__ Dockerfile


---

## Prerequisites

Before running the project, ensure the following tools and accounts are available:

- **AWS Account** with Access Key and Secret Key.  
- **RapidAPI Account** with a subscription to Sports Highlights API.  
- **Tools installed locally:**  
  - Docker (`docker --version`)  
  - AWS CLI (`aws --version`)  
  - Python 3 (`python3 --version`)  
  - Terraform (`terraform version`)  

---

## Setup & Installation

### 1. Terraform Infrastructure

Terraform provisions the required AWS resources:

- **S3 Buckets** for highlights metadata, videos, and logs.  
- **EC2 instance** to run the Docker container.  
- **ECR repository** for storing Docker images.  

**Steps to provision:**

```bash
# Initialize Terraform
cd terraform
terraform init

# Preview resources
terraform plan

# Apply configuration
terraform apply

```
**Configuration of .env**
```
RAPIDAPI_KEY=<your_rapidapi_key>
S3_BUCKET=<your_s3_bucket_name>
AWS_ACCESS_KEY_ID=<your_aws_access_key>
AWS_SECRET_ACCESS_KEY=<your_aws_secret_key>
LEAGUE=<league_name>
DATE=<YYYY-MM-DD>
```
**The Next Steps**
- Push the image into the ECR using the view commands after the repo is created.
- Pull the image into the EC2 instance and then run the docker image.

