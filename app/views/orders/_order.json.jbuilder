json.extract! order, :id, :client_id, :order_number, :payment_method, :delivery_method, :list_products, :cost_goods, :total_cost, :order_date, :created_at, :updated_at
json.url order_url(order, format: :json)
