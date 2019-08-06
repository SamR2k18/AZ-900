#!/bin/bash

#Update for admin password
AdminPassword=Sam@123456789

#create resource group
az group create --name "SamRG1" --location "NorthCentralUS"

#create virtual Network
az Network vnet create --resource -group SamRG1 --name samvnet1 --subnet-name "samsub1"

#Create public Ip address

az Network public-Ip create --resource-group SamRG1 --name SamPublicIP1

#Create a Network Secutity Group
az Network nsg create --resource-group SamRG1 --name SamSecgr1

#Create Vnet card and associate with PiP nad NSG
az Network nic create --resource-group SamRG1 --name Samnet1 --vnet-name samvnet1 --subnet samsub1 --Network-Secutity-group SamSecgr1 --public-Ip-address SamPublicIP1

# Create VMsamvnet1 --subnet-name samsub1
az vm create --resource-group SamRG1 --name SamVM2019 --location NorthCentralUS --nics Samnet1 --image win2019datacenter --admin-username azureuser1 --admin-password Sam@123456789

# Open port 3389 to Allow RDP traffic to host
az vm Open-port --port 3389 --resource-group SamRG1 --name SamVM2019



