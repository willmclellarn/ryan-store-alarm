# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    # puts 'ryan rules'
    # FetchOrderCountJob.perform_now
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    render(json: { products: @products })
  end
end
