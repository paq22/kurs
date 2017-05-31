module ProductsHelper
  def product_options()
    arr = []
    Product.all.each do |p|
      arr << [p.title, p.id] if p.quantity_in_stock >= p.minimum_quantity
    end
    return arr
  end
end
