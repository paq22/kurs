json.extract! product, :id, :title, :short_description, :full_description, :list_id_images, :base_price, :current_price, :quantity_in_stock, :article, :minimum_quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
