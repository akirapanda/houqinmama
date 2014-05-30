class GoodsImage < ActiveRecord::Base
  validates :cover,:presence => true
  belongs_to :user
  belongs_to :imageable, :polymorphic => true
  
  mount_uploader :cover, IconUploader
end