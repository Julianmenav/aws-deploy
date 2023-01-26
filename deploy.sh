#! /bin/bash
STACK_NAME=cloudformation-node
REGION=us-east-1
CLI_PROFILE=default
EC2_INSTANCE_TYPE=t2.micro

echo -e "\n=========== Desplegando  main.yml ================="

aws cloudformation deploy \
	--region $REGION \
	--profile $CLI_PROFILE \
	--stack-name $STACK_NAME \
	--template-file main.yml \
	--no-fail-on-empty-changeset \
	--capabilities CAPABILITY_NAMED_IAM \
  --parameter-override EC2InstanceType=$EC2_INSTANCE_TYPE

if [ $? -eq 0 ]; then
	aws cloudformation list-exports \
		--profile default \
		--query "Exports[?Name=='InstanceId'].Value"
fi