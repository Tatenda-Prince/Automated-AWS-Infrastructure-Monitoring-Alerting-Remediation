output "ec2_instance_id" {
  value = aws_instance.monitoring_instance.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.auto_remediation.function_name
}
