class AddShop < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :weixin_token
      t.string :short_name
      t.string :cate_type
      t.text :description
      t.integer :user_id
      t.intger :level
      t.timestamps
    end
    
    create_table :products do |t|
      t.string :cover
      t.string :name
      t.integer :shoping_id
      
      t.decimal :price,:default=>0, :precision => 13, :scale => 2  
      t.string :unit
      t.text :description
      
      t.integer :buy_counter
      t.intger  :like_counter
      t.boolean :is_visiable
      t.boolean :is_recommend
      t.integer :order_point
      t.text :note
      t.timestamps
    end
    
    
  end
end
