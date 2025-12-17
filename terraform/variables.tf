variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-2"
}

variable "state_bucket" {
  description = "S3 bucket for Terraform state"
  type        = string
}

variable "state_key" {
  description = "Key for state file in S3"
  type        = string
  default     = "terraform/state"
}

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
