class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :commentable_type
      t.string :commentable_id
      t.text :body
      t.timestamps
    end
    
    create_table :status_log do |t|
      t.integer :user_id
      t.string :statusable_type
      t.string :statusable_id
      t.string :before_stauts
      t.string :after_status
      t.text :body
      t.timestamps
    end
    
  end
end
