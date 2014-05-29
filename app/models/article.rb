class Article < ActiveRecord::Base
  belongs_to :article_cate
  paginates_per 10
  validates :title,:presence => true
  mount_uploader :cover, CoverUploader
  
end