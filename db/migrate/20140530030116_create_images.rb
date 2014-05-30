class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.text :name
      t.string :image
      t.string :imageable_type
      t.string :imageable_id
      t.timestamps
    end
    
    create_table :goods_images do |t|
      t.integer :user_id
      t.string :cover
      t.string :imageable_type
      t.string :imageable_id
      t.timestamps
    end
  end
end
