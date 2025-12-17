variable "domain" {
  description = "The domain to verify with SES"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "The Cloudflare Zone ID for your domain"
  type        = string
}
