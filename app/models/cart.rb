class Cart < ActiveRecord::Base
  has_many :shopping_items
end