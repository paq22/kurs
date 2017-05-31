class Client < ActiveRecord::Base
  has_many :orders
  
  validates :name, presence: true, length: {maximum: 200}
  validates :phone, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 50}

end
