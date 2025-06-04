provider "azurerm" {
    features {}
subscription_id = "fd240ce0-897d-4c0e-a243-662d89ccda9a"

}
      
resource "azurerm_resource_group" "git-rg" {
  name     = var.resource_group_name
  location = var.location
}      

resource "azurerm_kubernetes_cluster" "aks-git" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "eaks1"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

