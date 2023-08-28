
## Basic information
variable "org" {
  type        = string
  description = "prefix for naming"
  default = "zt"
}

variable "location" {
  type        = string
  description = "Location for azure"
}

variable "Subscription" {
  type        = string
  description = "Azure Subscription ID"
}

variable "environment" {
  type        = string
  description = "Environment"
  default = "dev"
}

variable "deploymentname" {
  type        = string
}


## Tags
variable "purpose" {
  type        = string
}

variable "owner" {
  type        = string
}
variable "customer" {
  type        = string
}

variable "project" {
  type        = string
}


## resource naming

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default = "rg"
}

variable "k8s_name" {
  type        = string
  default = "k8s"
}

variable "storage_account_name" {
  type        = string
  default = "stacc"
}


# K8s
variable "k8s_nodecount" {
  type        = number
}
variable "k8s_maxcount" {
  type        = number
}
variable "k8s_mincount" {
  type        = number
}
variable "k8s_size" {
  type        = string
}

variable "acr_id" {
  type        = string
}

variable "k8s_dnsprefix" {
  type        = string
}

variable "k8s_adminids" {
  type = list
}

variable "azdevops-grpid" {
  type = string
}


