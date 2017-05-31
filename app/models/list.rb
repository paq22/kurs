class List < ActiveRecord::Base
  belongs_to :product
  belongs_to :order, inverse_of: :lists
  
  validates :product, presence: true
  validates :order, presence: true
  validates :quantity_at_order, presence: true

end
