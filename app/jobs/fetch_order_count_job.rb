class FetchOrderCountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'im in the job'
    @orders = JSON.parse(ShopifyAPI::Order.find("count", params: {status: 'any'}).to_json)
    @order_count = @orders["count"]
    puts @order_count
    puts 'is the # of orders'
    # Do something later
  end
end
