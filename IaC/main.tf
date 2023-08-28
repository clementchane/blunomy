provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az_rg" {
  provider = azurerm.#{subname}#
  name     = "${var.org}-${var.environment}-${var.deploymentname}-${var.resource_group_name}"
  location = var.location
  tags = {
    purpose = var.purpose
    environment = var.environment
    project = var.project
    owner = var.owner
    customer = var.customer
  }
}


resource "azurerm_kubernetes_cluster" "azk8s" {
  provider = azurerm.#{subname}#
  name                = "${var.org}-${var.environment}-${var.deploymentname}-${var.k8s_name}"
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
  dns_prefix          = var.k8s_dnsprefix

  default_node_pool {
    name       = "default"
    node_count = var.k8s_nodecount
    vm_size    = var.k8s_size
    enable_auto_scaling = true
    max_count = var.k8s_maxcount
    min_count = var.k8s_mincount
    scale_down_mode = "Delete"
  }

  role_based_access_control_enabled = true
  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = var.k8s_adminids
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "kubweb_to_acr" {
  provider = azurerm.#{subname}#
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.azk8s.kubelet_identity[0].object_id
  depends_on = [
    azurerm_kubernetes_cluster.azk8s
  ]
}


data "azurerm_client_config" "current" {}

data "azurerm_kubernetes_cluster" "azaks" {
  provider = azurerm.#{subname}#
  name                = azurerm_kubernetes_cluster.azk8s.name
  resource_group_name = azurerm_resource_group.az_rg.name
}

resource "azurerm_role_assignment" "aksspnadm" {
  provider = azurerm.#{subname}#
  scope              = data.azurerm_kubernetes_cluster.azaks.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id       = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "aksrbacspnadm" {
  provider = azurerm.#{subname}#
  scope              = data.azurerm_kubernetes_cluster.azaks.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id       = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "aksrbacspnadmgrp" {
  provider = azurerm.#{subname}#
  scope              = data.azurerm_kubernetes_cluster.azaks.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id       = var.azdevops-grpid
}

