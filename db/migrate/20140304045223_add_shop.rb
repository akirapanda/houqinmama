class AddShop < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :weixin_token
      t.string :short_name
      t.string :cate_type
      t.text :description
      t.integer :user_id
      t.integer :level
      t.timestamps
    end
    
    create_table :products do |t|
      t.string :cover
      t.string :name
      t.integer :shoping_id
      t.integer :product_cate_id
      t.decimal :price,:default=>0, :precision => 13, :scale => 2  
      t.string :unit
      t.text :description
      
      t.integer :buy_counter
      t.integer  :like_counter
      t.boolean :is_visiable
      t.boolean :is_onsale
      
      t.boolean :is_recommend
      t.integer :order_point
      t.text :note
      t.timestamps
    end
    
    create_table :product_cates do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    
    
    create_table :shoppings do |t|
      
      t.integer :shoping_id
      
      t.integer :user_id
      t.integer :weixin_user_id
      
      t.string :customer_name
      t.string :customer_address
      
      t.string :school_area
      t.string :customer_build
      
      t.string :mobile_phone
      t.string :status
      t.string :receive_time
      t.string :channel
      
      t.text :remark
      
      t.decimal :amount,:default=>0, :precision => 13, :scale => 2  
      t.decimal :transfer_fee,:default=>0, :precision => 13, :scale => 2  
      t.decimal :actual_amount,:default=>0, :precision => 13, :scale => 2  
      
      t.timestamps
    
    end
    
    create_table :shopping_items do |t|
      t.integer :product_id
      t.integer :shopping_id
      t.integer :cart_id
      t.string :product_name
      t.decimal :product_price,:default=>0, :precision => 13, :scale => 2  
      t.integer :quantity
      t.string :product_unit
      t.timestamps
    end
    
    
    create_table :carts do |t|
      t.integer :user_id
      t.integer :weixin_user_id
      t.timestamps
    end
  end
end
