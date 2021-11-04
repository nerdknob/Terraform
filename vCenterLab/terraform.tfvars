vcenter_creds = {
    username = "administrator@vsphere.local",
    password = "VMware1!"
}
esxi_creds = {
    username = "root",
    password = "VMware1!"
}
vcenter_ip = "10.10.10.1"
datacenters = {
    dc1 : {
        name = "dc1"
    }
}
clusters = {
    mgmt : {
        name                 = "mgmt"
        datacenter           = "dc1"
        drs_enabled          = false
        drs_automation_level = "manual"
        ha_enabled           = false
    },
    cluster01 : {
        name                 = "cluster01"
        datacenter           = "dc1"
        drs_enabled          = false
        drs_automation_level = "manual"
        ha_enabled           = true
    },
    cluster02 : {
        name                 = "cluster02"
        datacenter           = "dc1"
        drs_enabled          = false
        drs_automation_level = "manual"
        ha_enabled           = true
    }
}
esxi_hosts = {
    esxi01 : {
        name = "esxi01"
        ip = "10.10.10.2"
        cluster = "mgmt"
    },
    esxi100 : {
        name = "esxi100"
        ip = "10.10.10.3"
        cluster = "cluster01"
    },
    esxi101 : {
        name = "esxi101"
        ip = "10.10.10.4"
        cluster = "cluster01"
    },
    esxi102 : {
        name = "esxi102"
        ip = "10.10.10.5"
        cluster = "cluster02"
    },
    esxi103 : {
        name = "esxi103"
        ip = "10.10.10.6"
        cluster = "cluster02"
    }
}