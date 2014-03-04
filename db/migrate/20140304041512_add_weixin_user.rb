class AddWeixinUser < ActiveRecord::Migration
  def change
    create_table :weixin_users do |t|
      t.string :open_id
      t.integer :user_id
      t.string :name
      t.string :group
      t.text :note
      t.timestamps  
    end
    
    add_index :weixin_users, :open_id,  :unique => true
    
  end
end
