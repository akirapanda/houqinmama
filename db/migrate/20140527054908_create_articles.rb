class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.integer :article_cate_id
      t.datetime :post_time
      t.boolean :hidden,:default=>true
      t.text :content
      t.string :title
      t.string :keywords
      t.string :breif
      t.timestamps
    end
    
    create_table :article_cates do |t|
      t.timestamps
    end
    
  end
end
