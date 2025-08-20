module "realm" {
  source     = "./modules/realm"
  realm_name = "company"
}
module "client" {
  source      = "./modules/clients"
  realm_id    = module.realm.id
  client_id   = "vuejs"
  client_name = "My Application"

  redirect_uris = [
    "http://localhost:3000/*",
    "https://vuejs-frontend.com/*"
  ]

  base_url = "https://vuejs-frontend.com"
  web_origins = [
    "https://vuejs-frontend.com"
  ]
}
