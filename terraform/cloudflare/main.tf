terraform {
  cloud {
    organization = "deadrobot"

    workspaces {
      name = "cloudflare"
    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.7.1"
    }
  }

}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_dns_record" "traefik" {
  zone_id = var.cloudflare_zone_id
  name    = "traefik.${var.public_domain}"
  content = var.cname_target
  ttl     = 1
  type    = "CNAME"
  proxied = true
}
