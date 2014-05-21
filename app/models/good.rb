class Good < ActiveRecord::Base
  validates :name, :no,:goods_cate_id,:unit,:presence => true
  has_many :products
  belongs_to :goods_cate
  belongs_to :goods_type
  mount_uploader :icon, IconUploader
end