class AddWeixinMessage < ActiveRecord::Migration
  def change
    create_table :weixin_messages do |t|
      t.string :from_user
      t.string :to_user
      t.string :type
      t.datetime :create_time
      t.string :text_content
      t.string :msg_id
      t.string :event
      t.timestamps
    end
    

  end
end
