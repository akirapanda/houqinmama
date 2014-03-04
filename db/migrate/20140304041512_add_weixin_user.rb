class AddWeixinUser < ActiveRecord::Migration
  def change
    create_table :weixin_users do |t|
      t.string :open_id
      t.string :name
      t.string :group
      t.text :note
      t.timestamp  
    end
  end
end
