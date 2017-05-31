class Product < ActiveRecord::Base
  has_many :lists

  validates :title, presence: true, length: {maximum: 200}
  validates :short_description, presence: true, length: {maximum: 200}
  validates :full_description, presence: true, length: {maximum: 2600}
  validates :list_id_images, presence: true
  validates :base_price, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :current_price, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :quantity_in_stock, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :article, presence: true, uniqueness: true
  validates :minimum_quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

end
