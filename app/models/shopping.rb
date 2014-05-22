class Shopping < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  has_many :shopping_items
end