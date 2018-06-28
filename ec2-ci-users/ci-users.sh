ami="ami-a4dc46db" #N.Virginia
region=us-east-1
type=t2.micro
key=SreeDemoKeyUSEast
sg=sg-b67abbfd
sn=subnet-17965760
#====================

tag="Lab-Sree-$(date +%s)"

aws ec2 run-instances \
--region $region \
--image-id $ami \
--count 1 \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tag}]" \
--instance-type $type \
--key-name $key \
--user-data file://./user-data-users.txt \
--subnet-id $sn \
--security-group-ids $sg
# --iam-instance-profile Name=SreeCodeCommitFullAccess

# $ aws configure
# AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
# AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
# Default region name [None]: us-west-2
# Default output format [None]: json

# $ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
# $ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
# $ export AWS_DEFAULT_REGION=us-west-2