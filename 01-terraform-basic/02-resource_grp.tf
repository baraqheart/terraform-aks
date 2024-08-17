# create a resource group
resource "azurerm_resource_group" "aks" {
  name     = "${var.project_name}-aks"
  location = "West Europe"
}

# create a data source for aks versions to latest, excluding preview versions
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_service_versions
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false  

}

# random pet to append resources names, this ensures uniqeness
resource "random_pet" "aks" {
  prefix = var.prefix
}

