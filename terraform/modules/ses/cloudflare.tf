terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

locals {
  dkim_tokens = {
    dkim1 = aws_ses_domain_dkim.dkim.dkim_tokens[0]
    dkim2 = aws_ses_domain_dkim.dkim.dkim_tokens[1]
    dkim3 = aws_ses_domain_dkim.dkim.dkim_tokens[2]
  }
}

resource "cloudflare_dns_record" "ses_verification" {
  zone_id = var.cloudflare_zone_id
  name    = "_amazonses.${var.domain}"
  content = aws_ses_domain_identity.domain.verification_token
  type    = "TXT"
  ttl     = 300
}

resource "cloudflare_dns_record" "ses_dkim" {
  for_each = local.dkim_tokens
  zone_id  = var.cloudflare_zone_id
  name     = "${each.value}._domainkey.${var.domain}"
  content  = "${each.value}.dkim.amazonses.com"
  type     = "CNAME"
  ttl      = 300
}

resource "cloudflare_dns_record" "spf" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain
  content = "v=spf1 include:amazonses.com ~all"
  type    = "TXT"
  ttl     = 300
}

resource "cloudflare_dns_record" "dmarc" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.${var.domain}"
  content = "v=DMARC1; p=none; rua=mailto:postmaster@${var.domain}"
  type    = "TXT"
  ttl     = 300
}


