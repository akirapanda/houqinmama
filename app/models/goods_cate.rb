class GoodsCate < ActiveRecord::Base
  validates :name,:cate_type,:presence => true
  CATE_TYPES=["主分类","子分类"]
  
  scope :main_types, -> { where(cate_type: '主分类') }
  scope :sub_types, -> { where(cate_type: '子分类') }
  
  belongs_to :parent_goods_cate  ,:class_name => "GoodsCate", :foreign_key => "parent_goods_cate_id"  
  has_many :children_goods_cates ,:class_name => "GoodsCate", :foreign_key => "parent_goods_cate_id"  
  
  after_save :update_parent_cate_id
  
  def parent_cate_name
    self.try(:parent_goods_cate).try(:name)
  end
  
  private
  
  def update_parent_cate_id
    if self.cate_type == "主分类" && self.parent_goods_cate_id != self.id
      self.parent_goods_cate_id = self.id
      self.save
    end
  end
  
end