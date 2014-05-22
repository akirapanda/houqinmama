class ShoppingItem < ActiveRecord::Base
  has_many :shopping
  belongs_to :product
end