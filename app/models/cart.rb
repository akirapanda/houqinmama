class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  
  def total_count
    self.cart_items.inject(0) { |sum, i| sum+i.quantity }
  end
  
  def total_amount
    self.cart_items.inject(0) { |sum, i| sum+i.amount }
  end
  
  
  def add_item(item)
    puts "id is #{item.product_id}"
    current_item = cart_items.find_by_product_id(item.product_id)    
    if current_item
      current_item.quantity+=item.quantity
    else
      current_item = item
      item.cart = self
    end
    current_item.cal_amount
    current_item
  end
end