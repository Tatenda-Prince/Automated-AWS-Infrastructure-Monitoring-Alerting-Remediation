# AWS Infrastructure Monitoring, Alerting & Remediation using Terraform

![image_alt]()


## Project Overview
This project automates the monitoring, alerting, and remediation of AWS EC2 instances using Terraform (Infrastructure as Code - IaC). It ensures high availability and proactive failure management by utilizing AWS services such as CloudWatch, SNS, Lambda, and IAM. The system automatically restarts an EC2 instance when CPU utilization exceeds a predefined threshold, minimizing downtime.

## Project Objective
1.Automate AWS infrastructure monitoring and alerting.
2.Send notifications when critical thresholds are breached.
3.Implement an auto-remediation mechanism using AWS Lambda.
4.Demonstrate Terraform’s capability in managing AWS resources efficiently.

## Features
1.Automated Monitoring: CloudWatch tracks EC2 instance performance.

2.lerting System: SNS sends notifications (Email/SMS) when CPU utilization is high.

3.Auto-Remediation: A Lambda function automatically restarts the EC2 instance.

4.Infrastructure as Code (IaC): Terraform provisions and manages the entire infrastructure.

5.Scalability: Can be extended to monitor multiple instances or add additional alerts.

## Technologies Used
1.Terraform:Infrastructure as Code (IaC)

2.AWS EC2:Virtual machine hosting the application

3.AWS CloudWatch:Monitoring CPU usage and triggering alarms

4.AWS SNS:Sending email/SMS alerts

5.AWS Lambda:Automatically restarting EC2 instances

6.AWS IAM:Secure role-based access control

## Use Case
You work as a Cloud Engineer at Up The Chels Tech and you tasked with implementing a automated monitoring,Alerting and Remediation infrastructure that will reduce manual intervention in handling infrastructure failure to ensure high availability and fault tolerance for cloud applications

## Prerequisites
Before running this project, ensure you have the following:

1.AWS Account with necessary permissions (IAM Role for Terraform & Lambda).

2.Terraform installed (>=1.0 version recommended).

3.AWS CLI configured (aws configure).

4.An SSH key pair (tatendaKeypair in this example) created in AWS.



## Step 1: Clone the Repositorys



