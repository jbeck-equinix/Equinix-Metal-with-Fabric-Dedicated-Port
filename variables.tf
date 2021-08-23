variable "auth_token" {
  description = "Metal personal API Key"
  type        = string
}

variable "project_id" {
  description = "Metal Project ID"
  type        = string
}

variable "metro" {
  description = "Equinix Metal metro code"
  type        = string
  default     = "dc"
}

variable "metal_vlan_description" {
  description = "Metal vlan description"
  type        = string
  default     = "vlan1"
}

variable "metal_vxlan" {
  description = "Metal vlan id"
  type        = number
  default     = 3003
}

variable "hostname" {
  description = "Metal instance hostname"
  type        = string
  default     = "testhost-01"
}

variable "plan" {
  description = "instance size/plan"
  type        = string
  default     = "c3.medium.x86"
}

variable "operating_system" {
  description = "metal operating system"
  type        = string
  default     = "centos_7"
}

variable "billing_cycle" {
  description = "billing cycle"
  type        = string
  default     = "hourly"
}

variable "metal_network_mode" {
  description = "metal network mode"
  type        = string
  default     = "hybrid-bonded"
}

variable "metal_node_count" {
  description = "metal device count"
  type        = number
  default     = 1
}

variable "port_name" {
  description = "vlan attachment port name"
  type        = string
  default     = "bond0"
}

variable "connection_id" {
  description = "Metal Fabric Connection ID"
  type        = string
}

variable "port_id" {
  description = "Metal Dedicated Port ID"
  type        = string
}

variable "nni_vlan" {
  description = "vlan id for the metal virtual connection"
  type        = string
  default     = "4001"
}

variable "metal_virtual_connection_name" {
  description = "metal virtual connection name"
  type        = string
  default     = "my test connection"
}

variable "client_id" {
  description = "Equinix API Client ID"
  type        = string
}

variable "client_secret" {
  description = "Equinix API Client Secret"
  type        = string
}

variable "profile_id" {
  description = "Equinix Fabric seller profile UUID"
  type        = string
}

variable "vlan_stag" {
  description = "Fabric VLAN ID"
  type        = number
  default     = 4001
}

variable "dedicated_port_name" {
  description = "Fabric Dedicated Port Name"
  type        = string
}

variable "Fabric_connection_name" {
  description = "Fabric connection name"
  type        = string
  default     = "test connection"
}

variable "Fabric_connection_speed" {
  description = "Fabric connection speed"
  type        = number
  default     = 50
}

variable "speed_unit" {
  description = "Fabric connection speed Unit"
  type        = string
  default     = "MB"
}

variable "seller_metro_code" {
  description = "Sellers Equinix data center Metro Code"
  type        = string
  default     = "DC"
}

variable "email_notifications" {
  description = "email addresses for service notifications"
  type        = list(string)
}
