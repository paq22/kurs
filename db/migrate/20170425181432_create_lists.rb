class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :product, index: true, foreign_key: true, null: false
      t.references :order, index: true, foreign_key: true, null: false
      t.integer :quantity_at_order, null: false

      t.timestamps null: false
    end
  end
end
