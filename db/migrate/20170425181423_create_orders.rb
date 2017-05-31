class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client, index: true, foreign_key: true, null: false
      t.integer :order_number, null: false
      t.string :payment_method, null: false
      t.string :delivery_method, null: false
      t.text :list_products
      t.float :cost_goods, null: false, numericality: {greater_than_or_equal_to: 1}
      t.float :total_cost, null: false, numericality: {greater_than_or_equal_to: 1}
      t.date :order_date, null: false
      

      t.timestamps null: false
    end
    #~ reversible do |dir|
      #~ dir.up do
        #~ execute ("ALTER TABLE orders ADD CHECK (payment_method IN('наличными при получении','банковской картой','электронными деньгами','через терминал оплаты','sms-сообщением')")
      #~ end
    #~ end
  #~ end
    #~ reversible do |dir|
      #~ dir.up do
        #~ execute ("ALTER TABLE orders ADD CHECK (delivery_method IN('курьер','самовывоз','почтой России','Постамат PickPoint')")
      #~ end
    #~ end
  end
end

