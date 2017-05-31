class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false, limit:200
      t.string :phone, null: false, limit:50
      t.string :address
      t.string :email, null: false, limit:50

      t.timestamps null: false
    end
  end
end
