terraform {
  required_providers {
    metal = {
      source  = "equinix/metal"
      version = ">= 3"
    }
    equinix = {
      source = "equinix/equinix"
    }
  }
}

provider "metal" {
  auth_token = var.auth_token
}

resource "metal_vlan" "vlan1" {
  metro       = var.metro
  project_id  = var.project_id
  description = var.metal_vlan_description
  vxlan       = var.metal_vxlan
}

#Deploy Metal Intance
resource "metal_device" "node" {
  count = var.metal_node_count

  hostname         = var.hostname
  plan             = var.plan
  metro            = var.metro
  operating_system = var.operating_system
  billing_cycle    = var.billing_cycle
  project_id       = var.project_id
  user_data = templatefile("${path.module}/templates/user_data.sh.tpl", {
    LAST_OCTET  = count.index + 5
    METAL_VXLAN = var.metal_vxlan
  })
}

#Set Metal instance to Hybrid Bonded network mode
resource "metal_device_network_type" "node" {
  count = var.metal_node_count

  device_id = metal_device.node[count.index].id
  type      = var.metal_network_mode
}

#attach instance to Metal VLAN1
resource "metal_port_vlan_attachment" "router_vlan_attach" {
  count = var.metal_node_count

  device_id = metal_device.node[count.index].id
  port_name = var.port_name
  vlan_vnid = metal_vlan.vlan1.vxlan
}

#Pair Project VLAN1 to Fabric VC
resource "metal_virtual_circuit" "test" {
  connection_id = var.connection_id
  project_id    = var.project_id
  port_id       = var.port_id
  vlan_id       = metal_vlan.vlan1.id
  nni_vlan      = var.nni_vlan
  name          = var.metal_virtual_connection_name
}

provider "equinix" {
  client_id     = var.client_id
  client_secret = var.client_secret
}

data "equinix_ecx_port" "dedicated_port" {
  name = var.dedicated_port_name
}

resource "equinix_ecx_l2_connection" "jbeck-labs" {
  name              = var.Fabric_connection_name
  profile_uuid      = var.profile_id
  speed             = var.Fabric_connection_speed
  speed_unit        = var.speed_unit
  notifications     = var.email_notifications
  port_uuid         = data.equinix_ecx_port.dedicated_port.id
  vlan_stag         = var.vlan_stag
  seller_metro_code = var.seller_metro_code
}
