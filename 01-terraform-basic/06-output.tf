# get aks version
output "versions" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

# print resource group name
output "rg_name" {
  value = azurerm_resource_group.aks.name
}


output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}