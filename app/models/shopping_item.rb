class ShoppingItem < ActiveRecord::Base
  has_many :shopping
  belongs_to :product
  
  def build_with_cart_item(cart_item)
    self.product_id = cart_item.product_id
    self.no = cart_item.no
    self.name = cart_item.name
    self.quantity = cart_item.quantity
    self.point = cart_item.point
    self.price = cart_item.price
    self.amount = cart_item.amount
    self
  end
  
  def cal_amount
    self.amount = self.price * self.quantity
  end
  
end