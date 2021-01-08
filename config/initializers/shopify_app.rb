ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV.fetch('SHOPIFY_API_KEY', '').presence || raise('Missing SHOPIFY_API_KEY')
  config.secret = ENV.fetch('SHOPIFY_API_SECRET', '').presence || raise('Missing SHOPIFY_API_SECRET')
  config.old_secret = ""
  config.scope = "read_products, read_orders, write_orders" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2021-01"
  config.shop_session_repository = 'Shop'
  config.allow_jwt_authentication = true
  config.allow_cookie_authentication = false
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
