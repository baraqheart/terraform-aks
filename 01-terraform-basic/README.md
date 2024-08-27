# PROVISIONING AKS USING TERRAFORM

This project contains a step by step information on how to provision aks using [terraform]()

Prerequisites:
- create a seperate resource group for backend files
- create a storage account with a unique name in the resource  group created in the previous step
- create a container with 'terraform' name

01. write out all the neccesary providers to complete the project, which are:
- azurerm
- azuread
- random

02. define the resource group in which all resources will be created

03. azure ad is used to enforce security in the infrastructure

04. create a log analytics workspace for monitoring, to ensure reliabilit and   availability of the cluster

05. create the cluster specifying the types of nodes to included in it

06. it is important to output some information about the cluster, so be sure to include it in the terraform files

07. variables promotes readability and reusability in our code.
    it is an efficient way to manage any code

08. create a .gitignore file to protect your state files

















REFERENCES
[azure backend docs](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)