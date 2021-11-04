variable "vcenter_creds" {
  description = "vCenter Credintials"
  type = map
}
variable "esxi_creds" {
  description = "ESXi Hosts Credintials"
  type = map
}
variable "vcenter_ip" {
  description = "IP Address of vCenter"
  type = string
}
variable "datacenters" {
  description = "map of datacenters"
  type = map
}
variable "clusters" {
  description = "maps of clusters"
  type = map
}
variable "esxi_hosts" {
  description = "map of ESXi Host details"
  type = map
}