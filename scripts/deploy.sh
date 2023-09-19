#!/bin/bash
set -Eeuxo pipefail

sam deploy \
  --stack-name ${ENV_STACK_NAME} \
  --template ${ENV_TEMPLATE} \
  --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
  --region ${ENV_REGION} \
  --s3-bucket ${ENV_BUCKET} \
  --no-confirm-changeset \
  --no-fail-on-empty-changeset \
  --role-arn ${ENV_CLOUDFORMATION_EXECUTION_ROLE} \
  --parameter-overrides \
    UserPoolName=${ENV_STACK_NAME}-userpool \
    UserPoolClientName=${ENV_STACK_NAME}-userpool-client \
    AppSyncApiName=${ENV_STACK_NAME}-graphql-api
