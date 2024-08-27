#create clusters [](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#role_based_access_control_enabled)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${azurerm_resource_group.aks.name}-cluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "${azurerm_resource_group.aks.name}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.versions[0]
  node_resource_group = "${azurerm_resource_group.aks.name}-node_rg"
    
  default_node_pool {
    name                 = "default"
    node_count           = 1
    vm_size              = "Standard_D2_v2"
    zones                = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 2
    min_count            = 1
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.versions[0]
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets" // AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets

    
    node_labels = {
      "env"  = "dev"
      "app"  = "ecom"
      "team" = "devops"
    }

    tags = {
      "env"  = "dev"
      "app"  = "ecom"
      "team" = "devops"
    }

  }

  # linux profile
 # linux_profile {
  ##  ssh_key {
   #   key_data = file(var.ssh-key)
    #}
  #}

  # windows profile
 # windows_profile {
  #  admin_username = var.user
  #  admin_password = var.pass
 # }


  # network profile
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard" // or standard
  }

  # RBAC and AD group
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = [azuread_group.aks.id]
    azure_rbac_enabled     = true
  }

  
  # identity block can either be systemAssigned or UserAssigned
  identity {
    type = "SystemAssigned"
 }

 
  oms_agent {      
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id
  }
 

  # tags are used to give more meaning or definition to resources 
  tags = {
    Environment   = "Dev"
    Owner         = "baraqheart"
    App           = "ecommerceApp"
    Nodepool_type = "system"
  }


}
