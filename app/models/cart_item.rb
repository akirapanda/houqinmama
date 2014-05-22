class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  
  def build_with_product(product)
    self.product_id = product.id
    self.name = product.name
    self.price = product.price
    self
  end
  
  def cal_amount
    self.amount = self.price * self.quantity
  end
  
  
end