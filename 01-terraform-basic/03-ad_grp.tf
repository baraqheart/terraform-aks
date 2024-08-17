data "azuread_client_config" "current" {}

resource "azuread_group" "aks" {
  display_name     = ""
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
  description = ""
}