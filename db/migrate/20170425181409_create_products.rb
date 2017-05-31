class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false, limit:200
      t.text :short_description, null: false, limit:200
      t.text :full_description, limit:2600
      t.string :list_id_images, null: false
      t.float :base_price, null: false, numericality: {greater_than_or_equal_to: 1}
      t.float :current_price, null: false, numericality: {greater_than_or_equal_to: 1}
      t.integer :quantity_in_stock, null: false, numericality: {only_integer: true, greater_than_or_equal_to: 0}
      t.integer :article, null: false
      t.integer :minimum_quantity, null: false, numericality: {only_integer: true, greater_than_or_equal_to: 1}
      
      t.index :article, unique: true

      t.timestamps null: false
    end
  end
end
