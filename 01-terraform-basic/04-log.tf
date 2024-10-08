
# create log analytics workspace for monitoring clusters
resource "azurerm_log_analytics_workspace" "aks" {
  name                = "${var.project_name}-logworkspace"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks.name
  sku                 = "PerGB2018"
  #retention_in_days   = 7
}

