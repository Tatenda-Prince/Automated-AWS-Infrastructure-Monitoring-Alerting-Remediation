import boto3
import os
import json
import logging

# Setup logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize EC2 client
ec2 = boto3.client('ec2')

def lambda_handler(event, context):
    logger.info(f"Received event: {json.dumps(event)}")

    # Try to get instance ID from SNS event
    instance_id = None
    try:
        if "Records" in event and event["Records"]:
            message = json.loads(event["Records"][0]["Sns"]["Message"])
            instance_id = message.get("Trigger", {}).get("Dimensions", [{}])[0].get("value")
    except Exception as e:
        logger.error(f"Error extracting instance_id from SNS: {str(e)}")

    # Fallback: Use environment variable if instance ID is not found
    if not instance_id:
        instance_id = os.getenv('INSTANCE_ID')

    if not instance_id:
        logger.error("INSTANCE_ID is missing in SNS message and environment variables.")
        return {
            'statusCode': 400,
            'body': 'Error: INSTANCE_ID not found'
        }

    try:
        logger.info(f"Attempting to reboot EC2 instance: {instance_id}")
        ec2.reboot_instances(InstanceIds=[instance_id])
        
        logger.info(f"Instance {instance_id} reboot initiated successfully.")
        return {
            'statusCode': 200,
            'body': f'Instance {instance_id} reboot initiated successfully.'
        }
    except Exception as e:
        logger.error(f"Error restarting instance {instance_id}: {str(e)}")
        return {
            'statusCode': 500,
            'body': f'Error restarting instance {instance_id}: {str(e)}'
        }
