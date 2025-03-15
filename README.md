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



## Step 1: Clone the Repository
1.1.Clone this repository to your local machine.

```language
git clone https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation.git
```

## Step 2 : Run Terraform workflow to initialize, validate, plan then apply
2.1.Terraform will provision:
1.EC2 with 
2.CloudWatch Alarm
3.SNS Topic
4.Lambda

2.2.In your local terraform visual code environment terminal, to initialize the necessary providers, execute the following command in your environment terminal.

```language
terraform init
```

Upon completion of the initialization process, a successful prompt will be displayed, as shown below.

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/4a0d34332336fb1b19a554ae42ce686006c3e037/screenshots/Screenshot%202025-03-15%20184358.png)


2.3.Next, let’s ensure that our code does not contain any syntax errors by running the following command


```language
terraform validate
```

The command should generate a success message, confirming that it is valid, as demonstrated below.

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/0fe0f56d464306673cb8968b219d11fa13398abc/screenshots/Screenshot%202025-03-15%20184726.png)

2.4.Let’s now execute the following command to generate a list of all the modifications that Terraform will apply.

```language
terraform plan
```
![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/a502fcd873efb2183e485f3e083361834e0ef7c6/screenshots/Screenshot%202025-03-15%20185304.png)

The list of changes that Terraform is anticipated to apply to the infrastructure resources should be displayed. The “+” sign indicates what will be added, while the “-” sign indicates what will be removed.

2.5.Now, let’s deploy this infrastructure! Execute the following command to apply the changes and deploy the resources. Note — Make sure to type “yes” to agree to the changes after running this command.

```language
terraform apply
```

Terraform will initiate the process of applying all the changes to the infrastructure. Kindly wait for a few seconds for the deployment process to complete.

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/2d718860405d0999ff31ad822b7be93955075f7f/screenshots/Screenshot%202025-03-15%20190138.png)


## Success
The process should now conclude with a message indicating “Apply complete”, stating the total number of added, modified, and destroyed resources, accompanied by several resources. 

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/8009a927c0dd7fd9684ac0156169a59e7d8e2774/screenshots/Screenshot%202025-03-15%20190230.png)


## Step 3: Verify creation of our resources
3.1.In the AWS Management Console, head to the EC2 Instance Console and verify that there is instance running as show below

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/8f58b646b9fbbb8e24723623e3e61f58796db55b/screenshots/Screenshot%202025-03-15%20190544.png)

3.2.In the AWS Management Console, head to the Lambda Console and verify that there is lambda function running as show below

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/c33ce278bf8ce98662cb2b5380cc3a2e0bc9a0c8/screenshots/Screenshot%202025-03-15%20190559.png)

3.3.In the AWS Management Console, head to the CloudWatch dashboard and verify that there is Alarm running as show below

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/c54ea48ff1dd7de863cf7fe9381e3e7341363432/screenshots/Screenshot%202025-03-15%20190611.png)

3.4.In the AWS Management Console, head to the Amazon SNS dashboard and verify that there is Topic running as show below

![image_alt](https://github.com/Tatenda-Prince/Automated-AWS-Infrastructure-Monitoring-Alerting-Remediation/blob/9239c0a7f5fa3b3bcc51f2f86938760c2d03f76c/screenshots/Screenshot%202025-03-15%20190655.png)


## Step 4: Testing the System
4.1.Once deployed, test the system by triggering a high CPU utilization alert:

4.2.Connect to the EC2 instance via SSH (replace `<your-public-ip>`):
Run the following commands

```language
ssh -i your-key.pem ec2-user@<your-public-ip>
```


```language
sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y stress
```
```language
tress --cpu 4 --timeout 300
```
This command will consume 100% CPU for 5 minutes (300 seconds).

It will trigger the CloudWatch alarm once CPU utilization crosses 80%.

![image_alt]()

4.3.Monitor CloudWatch Metrics:Check CloudWatch `CPUUtilization` metrics.Check if the status went `OK` to `ALARM`

![image_alt]()


4.4.Check SNS Notification:You should receive an email/SMS alert.

![image_alt]()


4.5.Verify Auto-Remediation:Check AWS Lambda Logs in CloudWatch to confirm instance restart.

![image_alt]()


## Future Enhancements
1.Extend monitoring to Memory and Disk usage.

2.Integrate AWS Systems Manager for in-depth diagnostics.

3.Implement Auto-Scaling for better fault tolerance.

4.Add a Slack/Teams webhook for real-time alerts.

## What We Learned
1.Terraform best practices for AWS infrastructure automation.

2.Proactive monitoring and alerting using AWS CloudWatch.

3.Automating issue resolution using AWS Lambda.

4.Importance of IAM roles in managing AWS security.

5.Real-world DevOps implementation that improves system reliability.

## Congratulations
We have succesfully created AWS Infrastructure Monitoring, Alerting & Remediation using Terraform by automating monitoring, alerting, and remediation of EC2 instances using AWS and Terraform. It ensures high availability, reducing downtime and manual intervention.




















