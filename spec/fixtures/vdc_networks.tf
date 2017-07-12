resource "vcd_network" "org_vdc_networks" {
  name          = "Our vDC"
  edge_gateway  = "Gateway-FRONTEND"
  gateway       = "192.0.2.1"
  netmask       = "255.255.255.0"
  dns1          = "8.8.8.8"
  dns2          = "8.8.4.4"
  dns_suffix    = "testing.example.com"

  static_ip_pool {
    start_address = "192.0.2.11"
    end_address   = "192.0.2.40"
  }
}
resource "vcd_network" "org_vdc_networks" {
  name          = "Our vDC"
  edge_gateway  = ""
  gateway       = "198.51.100.1"
  netmask       = "255.255.255.0"
  dns1          = "8.8.8.8"
  dns2          = "8.8.4.4"
  dns_suffix    = "testing.example.com"

  static_ip_pool {
    start_address = "198.51.100.11"
    end_address   = "198.51.100.40"
  }
}
