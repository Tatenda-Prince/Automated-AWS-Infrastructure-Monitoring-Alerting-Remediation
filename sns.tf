# Create SNS topic for EC2 alerts
resource "aws_sns_topic" "alerts" {
  name = "ec2-alerts-topic"
}

# Subscribe email to SNS topic
resource "aws_sns_topic_subscription" "email_target" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "tatendapmoyo61@gmail.com" # Change to your email
}

# Subscribe Lambda function to SNS topic
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.auto_remediation.arn
}
