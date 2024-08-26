data "azuread_client_config" "current" {}

resource "azuread_group" "aks" {
  display_name     = "${var.prefix}-grp"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
  description = "."
}