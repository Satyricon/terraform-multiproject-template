terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.30.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.31.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.4.3"
    }
  }
  backend "azurerm" {}
  required_version = ">= 1.3"
}

provider "azurerm" {
  features {}
  subscription_id = var.SUBSCRIPTION_ID
  tenant_id       = var.TENANT_ID
}

provider "azuread" {
  tenant_id = var.TENANT_ID
}

data "azurerm_subscription" "current" {}

/*
// Example data source definition using ENV variables for remote state reference
data "terraform_remote_state" "vnets" {
  backend = "azurerm"
  config = {
    subscription_id      = var.SUBSCRIPTION_ID
    resource_group_name  = var.TF_RG_NAME
    storage_account_name = var.TF_SA_NAME
    container_name       = var.TF_CONTAINER_NAME
    key                  = "core/vnets.terraform.tfstate"
  }
}
*/

# List of variables passed in via pipelines

variable "SUBSCRIPTION_ID" {
  type = string
}

variable "TENANT_ID" {
  type = string
}

variable "MSI_ID" {
  type = string
}

variable "TF_SUBNET_ID" {
  type = string
}

variable "TF_RG_NAME" {
  type = string
}

variable "TF_SA_NAME" {
  type = string
}

variable "TF_CONTAINER_NAME" {
  type = string
}
