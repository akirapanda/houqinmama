class InitShop < ActiveRecord::Migration
  def change
    #Basic Goods Table
    create_table :goods do |t|
      t.string :name
      t.string :no
      t.string :icon
      t.integer :goods_cate_id
      t.integer :goods_type_id
      t.integer :brand_id
      t.integer :vendor_id
      t.text :brief
      t.text :intro
      t.string :unit
      t.string :keywords
      t.boolean :sellable,:default=>true
      t.decimal :mk_price,:default=>0, :precision => 20, :scale => 2
      t.decimal :price,:default=>0, :precision => 20, :scale => 2
      t.decimal :weight,:default=>0, :precision => 20, :scale => 3
      t.integer :point,:default=>0
      t.integer :store,:default=>0
      t.text :params_desc
      t.text :pdt_desc
      t.timestamps
    end
    
    #Goods Category
    create_table :goods_cates do |t|
      t.string :name
      t.string :goods_cate_path
      t.string :cate_type
      t.integer :parent_goods_cate_id
      t.text :content
      t.timestamps
    end
    
    #Goods_Brand
    create_table :brands do |t|
      t.string :name
      t.string :url
      t.text :desc
      t.string :logo
      t.timestamps
    end
    
    #Goods_Vendor
    create_table :vendors do |t|
      t.string :name
      t.string :manager_name
      t.string :address
      t.text :desc
      t.string :logo
      t.timestamps
    end
    
    #Sell Product
    create_table :products do |t|
      t.string :name
      t.string :no
      t.string :icon
      t.integer :goods_cate_id
      t.integer :goods_type_id
      t.integer :brand_id
      t.integer :vendor_id
      t.text :brief
      t.text :intro
      t.string :unit
      t.string :keywords
      t.boolean :sellable,:default=>true
      t.decimal :mk_price,:default=>0, :precision => 20, :scale => 2
      t.decimal :price,:default=>0, :precision => 20, :scale => 2
      t.decimal :weight,:default=>0, :precision => 20, :scale => 3
      t.integer :point,:default=>0
      t.integer :store,:default=>0
      t.text :params_desc
      t.text :pdt_desc
      t.timestamps
    end
  end
end
