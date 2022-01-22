### AWS Cloudwatch event alarm module

This module creates alarms in Cloudwatch for any AWS service supported. It was created to be a generic module that will support any and all AWS services. It expects complete configuration for the alarm in form of a list. An example:

``` 
inputs = {
  name = "name-of-my-service"
  metric_alarms = {
    "my-alarm" = {
      alarm_name          = "my-alarm",
      alarm_actions       = "actions to perform on alarm, usual SNS ARN",
      alarm_actions_ok    = "same as previous if notification should be sent on status OK"    
      alarm_description   = "Alarm descriprion",
      comparison_operator = "GreaterThanThreshold",
      datapoints_to_alarm = 1,
      dimensions = {
        "LoadBalancer" = "my-load-balancer"
        "TargetGroup"  = "lb-target-group"
      },
      evaluation_periods = 1,
      metric_name        = "metric name in AWS",
      namespace          = "AWS/ApplicationELB",
      period             = 300,
      statistic          = "Sum",
      threshold          = 25,
      treat_missing_data = "notBreaching"
    }
  }
}
```

For details on values of each of the components see [AWS Services That Publish CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html). For detailed explanation of each of the components see [Resource: aws_cloudwatch_metric_alarm](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html).
