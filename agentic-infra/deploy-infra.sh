#!/bin/bash

# Function to deploy a template
deploy_template() {
  local resource_group=$1
  local template_file=$2
  local parameters_file=$3

  echo "Deploying ${template_file}..."
  az deployment group create \
    --resource-group "$resource_group" \
    --template-file "$template_file" \
    --parameters @"$parameters_file"

  if [ $? -eq 0 ]; then
    echo "Deployment of ${template_file} was successful!"
  else
    echo "Deployment of ${template_file} failed. Exiting."
    exit 1
  fi
}

# Variables
RESOURCE_GROUP="name of the resource-group"

# Check if the Azure CLI is installed
if ! command -v az &> /dev/null
then
    echo "Azure CLI not found! Please install Azure CLI first."
    exit 1
fi

# Ensure the user is logged in to Azure
echo "Checking if you are logged into Azure..."
if ! az account show &> /dev/null; then
    echo "You are not logged in to Azure. Logging in..."
    az login
fi
Deploy Monitoring resources (Log Analytics Workspace)
deploy_template "$RESOURCE_GROUP" "modules/monitoring/log-analytics.json" "modules/monitoring/parameters/logs-params.json"

# Deploy Container resources (ACR - Azure Container Registry)
deploy_template "$RESOURCE_GROUP" "modules/containers/acr.json" "modules/containers/parameters/acr-params.json"

# Deploy CAE resources (Container Apps Environments and Apps)
deploy_template "$RESOURCE_GROUP" "modules/containers/cae.json" "modules/containers/parameters/cae-params.json"
deploy_template "$RESOURCE_GROUP" "modules/containers/container-apps.json" "modules/containers/parameters/containers-parms.json"

# Deploy Database and storage ( DB and Blob storage)
deploy_template "$RESOURCE_GROUP" "modules/Database/db.json" "modules/Database/parameters/db-params.json"
deploy_template "$RESOURCE_GROUP" "modules/Database/blob-storage.json" "modules/Database/parameters/blob-params.json"


# Deploy Gateway resources (Application Gateway)
deploy_template "$RESOURCE_GROUP" "modules/gateway/app-gateway.json" "modules/gateway/parameters/APPGW-params.json"

echo "All resources deployed successfully!"
