#!/usr/bin/env python

# pip install boto3
import boto3

ec2 = boto3.resource('ec2')

for instance in ec2.instances.all():
	print (instance.id, instance.state)

# i-56502fa0 {'Code': 16, 'Name': 'running'}
# i-c40ad2ca {'Code': 16, 'Name': 'running'}
