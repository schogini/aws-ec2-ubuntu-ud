#!/bin/bash

# Clones from CodeCommit and user Instance Profile

ami="ami-a4dc46db" #N.Virginia
region=us-east-1
type=t2.micro
key=SreeDemoKeyUSEast
sg=sg-b67abbfd
sn=subnet-17965760



#====================

tag="Demo-CodeCommit-Apache-MySQL-Sree-$(date +%s)"

aws ec2 run-instances \
--region $region \
--image-id $ami \
--count 1 \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tag}]" \
--instance-type $type \
--key-name $key \
--user-data file://./user-data-apache-mysql-customweb.txt \
--subnet-id $sn \
--security-group-ids $sg \
--iam-instance-profile Name=SreeCodeCommitFullAccess