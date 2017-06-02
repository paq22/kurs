class Order < ActiveRecord::Base
  belongs_to :client
  has_many :lists, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :lists, allow_destroy: true
    
  validates :client, presence: true
  validates :order_number, presence: true
  validates :payment_method, presence: true
  validates :delivery_method, presence: true
  validates :cost_goods, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :total_cost, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :order_date, presence: true

  def self.search(params)
    result = Order.eager_load(:client, :lists, lists: :product)
    
    if !(params['search_order_number'].nil?) and !(params['search_order_number'].empty?)
      result = result.where(order_number: params['search_order_number'])
    end
    
    if !(params['search_order_payment_method'].nil?) and !(params['search_order_payment_method'].empty?)
      result = result.where(payment_method: params['search_order_payment_method'])
    end
    
    if !(params['search_order_delivery_method'].nil?) and !(params['search_order_delivery_method'].empty?)
      result = result.where(delivery_method: params['search_order_payment_method'])
    end
    
    if !(params['search_order_date1'].nil?) and !(params['search_order_date1'].empty?)
      arr = params['search_order_date1'].split(".").map{|x| x.to_s}
      result = result.where("order_date <= ???", arr[2], arr[1], arr[0])
    end
    
    if !(params['search_order_date0'].nil?) and !(params['search_order_date0'].empty?)
      arr = params['search_order_date0'].split(".").map{|x| x.to_s}
      result = result.where("order_date >= ???", arr[2], arr[1], arr[0])
    end
    
    if !(params['search_order_total_cost1'].nil?) and !(params['search_order_total_cost1'].empty?)
      result = result.where("total_cost <= ?", params['search_order_total_cost1'])
    end
    
    if !(params['search_order_total_cost0'].nil?) and !(params['search_order_total_cost0'].empty?)
      result = result.where("total_cost >=  ?", params['search_order_total_cost0'])
    end
    
    if !(params['search_order_cost_goods1'].nil?) and !(params['search_order_cost_goods1'].empty?)
      result = result.where("cost_goods <= ?", params['search_order_cost_goods1'])
    end
    
    if !(params['search_order_cost_goods0'].nil?) and !(params['search_order_cost_goods0'].empty?)
      result = result.where("cost_goods >= ?", params['search_order_cost_goods0'])
    end
    
    if !(params['search_order_list_products'].nil?) and !(params['search_order_list_products'].empty?)
      result = result.where("list_products ilike ?", "%#{params['search_order_list_products']}%")
    end
    
    if !(params['search_client_name'].nil?) and !(params['search_client_name'].empty?)
      result = result.where("clients.name ilike ?", "%#{params['search_client_name']}%")
    end
    
    if !(params['search_client_phone'].nil?) and !(params['search_client_phone'].empty?)
      result = result.where("clients.phone ilike ?", "%#{params['search_client_phone']}%")
    end
    
    if !(params['search_client_address'].nil?) and !(params['search_client_address'].empty?)
      result = result.where("clients.address ilike ?", "%#{params['search_client_address']}%")
    end
    
    if !(params['search_client_email'].nil?) and !(params['search_client_email'].empty?)
      result = result.where("clients.email ilike ?", "%#{params['search_client_email']}%")
    end
    
    if !(params['search_product_article'].nil?) and !(params['search_product_article'].empty?)
      query = Product.where("article = ?", params['search_product_article']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_title'].nil?) and !(params['search_product_title'].empty?)
      query = Product.where(title: params['search_product_title']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_short_description'].nil?) and !(params['search_product_short_description'].empty?)
      query = Product.where("short_description ilike ?", "%#{params['search_product_short_description']}%").ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_full_description'].nil?) and !(params['search_product_full_description'].empty?)
      query = Product.where("full_description ilike ?", "%#{params['search_product_full_description']}%").ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_base_price0'].nil?) and !(params['search_product_base_price0'].empty?)
      query = Product.where("base_price >= ?", params['search_product_base_price0']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_base_price1'].nil?) and !(params['search_product_base_price1'].empty?)
      query = Product.where("base_price <= ?", params['search_product_base_price1']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_quantity_in_stock0'].nil?) and !(params['search_product_quantity_in_stock0'].empty?)
      query = Product.where("quantity_in_stock >= ?", params['search_product_quantity_in_stock0']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_quantity_in_stock1'].nil?) and !(params['search_product_quantity_in_stock1'].empty?)
      query = Product.where("quantity_in_stock <= ?", params['search_product_quantity_in_stock1']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_quantity_in_stock0'].nil?) and !(params['search_product_quantity_in_stock0'].empty?)
      query = Product.where("quantity_in_stock >= ?", params['search_product_quantity_in_stock0']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_quantity_in_stock1'].nil?) and !(params['search_product_quantity_in_stock1'].empty?)
      query = Product.where("quantity_in_stock <= ?", params['search_product_quantity_in_stock1']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_minimum_quantity0'].nil?) and !(params['search_product_minimum_quantity0'].empty?)
      query = Product.where("minimum_quantity >= ?", params['search_product_minimum_quantity0']).ids
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_product_minimum_quantity1'].nil?) and !(params['search_product_minimum_quantity1'].empty?)
      query = Product.where("minimum_quantity <= ?", params['search_product_minimum_quantity1']).ids
      query << 0 if query.size == 0
      result = result.where("lists.product_id in (?)", query.join(','))
    end
    
    if !(params['search_list_quantity_at_order0'].nil?) and !(params['search_list_quantity_at_order0'].empty?)
      result = result.where("lists.quantity_at_order >= ?", params['search_list_quantity_at_order0'])
    end
    
    if !(params['search_list_quantity_at_order1'].nil?) and !(params['search_list_quantity_at_order1'].empty?)
      result = result.where("lists.quantity_at_order <= ?",params['search_list_quantity_at_order1'])
    end
    
    return result
  end
  
end
