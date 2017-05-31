module OrdersHelper

  def number_of_order
    if Order.count == 0
      number = 1
    else
      number = Order.last.order_number + 1
    end
    number
  end
  
  def date_of_order
    tn = Time.now
    date = Date.new(tn.year, tn.month, tn.day)
  end

end
