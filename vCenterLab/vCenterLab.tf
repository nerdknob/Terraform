# Establish vCenter connection
provider "vsphere" {
  user           = var.vcenter_creds.username
  password       = var.vcenter_creds.password
  vsphere_server = var.vcenter_ip
  allow_unverified_ssl = true
}

# Create Virtual Datacenters
resource "vsphere_datacenter" "datacenter" {
  for_each = var.datacenters
  name     = each.value.name
}

# Create Clusters
resource "vsphere_compute_cluster" "cluster" {
  for_each             = var.clusters
  name                 = each.value.name
  datacenter_id        = vsphere_datacenter.datacenter["${each.value.datacenter}"].moid
  drs_enabled          = each.value.drs_enabled
  drs_automation_level = each.value.drs_automation_level
  ha_enabled           = each.value.ha_enabled
}

# Get SSH thumbprints for ESXi hosts
data "vsphere_host_thumbprint" "thumbprint" {
  for_each = var.esxi_hosts
  address = each.value.ip
  insecure = true
}

# Add ESXi hosts to vCenter
resource "vsphere_host" "esxi_host_list" {
  for_each = var.esxi_hosts
  hostname = each.value.ip
  username = var.esxi_creds.username
  password = var.esxi_creds.password
  cluster  = vsphere_compute_cluster.cluster["${each.value.cluster}"].id
  thumbprint = data.vsphere_host_thumbprint.thumbprint["${each.value.name}"].id
}