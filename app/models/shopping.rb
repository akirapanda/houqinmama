class Shopping < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  has_many :shopping_items
  
  SEND_TIMES= ["12:00","18:00","20:30","次日12:15 - 19:50"]
  after_save :save_shopping_items
  
  
  def build_with_cart(cart)
    cart.cart_items.each do |item|
      shopping_item = ShoppingItem.new
      shopping_item.build_with_cart_item(item)
      shopping_items << shopping_item
    end
  end
  
  private 
  
  def save_shopping_items
    shopping_items.each do |item|
        item.amount=item.cal_amount
        item.save
    end
  end
  
end