terraform {
  # TODO: change `organization` to your own Terraform Cloud org
  cloud {
    organization = "StarlinerDev"
    workspaces {
      name = "workshop"
    }
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.57"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "workshop-terraform-key"
  # TODO: assign the public key you exported to an environment variable
  public_key = ___
}

resource "hcloud_server" "csee_server" {
  # TODO: each of these should reference a variable defined in vars.tf
  name = ___
  image = ___
  server_type = ___
  location = ___
  ssh_keys = [hcloud_ssh_key.default.id]
}

output "csee_server_ip" {
  value = hcloud_server.csee_server.ipv4_address
}
