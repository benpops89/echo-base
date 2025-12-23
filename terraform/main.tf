module "ses_domain" {
  source = "./modules/ses"

  domain               = var.domain
  cloudflare_zone_id   = var.cloudflare_zone_id
  cloudflare_api_token = var.cloudflare_api_token
}

resource "cloudflare_r2_bucket" "backup" {
  provider      = cloudflare.r2
  account_id    = var.cloudflare_r2_account_id
  name          = "backup"
  location      = "weur"
  storage_class = "Standard"
}
