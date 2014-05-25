class Shopping < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  has_many :shopping_items
  
  SEND_TIMES= ["12:00","18:00","20:30","次日12:15 - 19:50"]
  after_save :save_shopping_items
  
  validates :ship_time,:customer_address,:customer_name,:mobile,:presence => true
  
  def build_with_cart(cart)
    cart.cart_items.each do |item|
      shopping_item = ShoppingItem.new
      shopping_item.build_with_cart_item(item)
      shopping_items << shopping_item
    end
  end
  
  def calAmount(shopping)
    amount=0
    shopping.shopping_items.each do |item|
      amount = amount+item.amount
    end
    amount
  end
  
  
  
  def new_shopping_item_attributes=(item_attributes)
    item_attributes.each do |attributes|
        shopping_items.build(attributes)
    end
  end
  
  def exist_shopping_item_attributes=(item_attributes)
    
    shopping_items.reject(&:new_record?).each do |item|
      attributes = item_attributes[item.id.to_s]      
      if attributes        
        item.attributes = attributes
      else
        shopping_items.delete(item)
      end
    end
  end
  
  private 
  
  def save_shopping_items
    total_amount = 0
    shopping_items.each do |item|
        item.amount=item.cal_amount
        total_amount+= item.amount
        item.save
    end
    
  end
  
end