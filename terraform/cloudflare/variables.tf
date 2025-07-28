variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type = string
}

variable "public_domain" {
  type = string
}

variable "cname_target" {
  description = "The DNS target for the CNAME record (usually your Cloudflare Tunnel endpoint)"
  type        = string
}
