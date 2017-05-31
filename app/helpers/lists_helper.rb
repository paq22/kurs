module ListsHelper  
  def link_to_add_product(form, order)
    new_object = List.new()
    fields = form.fields_for(:lists, new_object, 
      :child_index => 'new_product') do |lf|
      render('orders/one_list_form', lf: lf, i: 'Новая')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
        id: 'add_product_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новый товар" 
    end
  end

  def link_to_remove_product(form)  
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_product') do 
      fa_icon('times', title: 'Удалить товар') + ' Удалить'      
    end
  end
end
