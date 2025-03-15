resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 60
  statistic          = "Average"
  threshold          = 80
  alarm_description  = "This alarm triggers if CPU utilization exceeds 80%."
  alarm_actions      = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.monitoring_instance.id
  }
}
