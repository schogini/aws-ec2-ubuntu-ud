#!/bin/bash

ami="ami-a4dc46db" #N.Virginia
region=us-east-1
type=t2.micro
key=SreeDemoKeyUSEast
sg=sg-b67abbfd
sn=subnet-17965760

#====================

tag="Demo-DockerHost-Sree-$(date +%s)"

aws ec2 run-instances \
--region $region \
--image-id $ami \
--count 1 \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tag}]" \
--instance-type $type \
--key-name $key \
--user-data file://./docker.txt \
--subnet-id $sn \
--security-group-ids $sg \
--iam-instance-profile Name=SreeCodeCommitFullAccess

aws ec2 --region $region wait instance-running --filters "Name=tag-value,Values=$tag"

echo Got it

ip=$(aws ec2 --region $region describe-instances --filters "Name=tag-value,Values=$tag" \
--query="[Reservations[0].Instances[0].NetworkInterfaces[0].Association.PublicIp]" \
 --output text)

echo IP=$ip

export DOCKER_HOST=tcp://$ip:2375
echo DOCKER_HOST=$DOCKER_HOST

#docker-compose up

# echo Done

# export DOCKER_CERT_PATH=/Users/ddavison/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
