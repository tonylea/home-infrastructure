terraform {
  backend "remote" {
    organization = "deadrobot"

    workspaces {
      name = "cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_zone" "domain" {
  name = var.public_domain
}

resource "cloudflare_record" "traefik" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "traefik"
  value   = var.public_domain
  type    = "CNAME"
  proxied = true
}
