class Product < ActiveRecord::Base
  belongs_to :good
  belongs_to :city
  validates :name, :no,:city_id,:presence => true
  
  scope :on_sale, -> { where(on_sale: true) }
  paginates_per 10
  
  def build_with_goods(goods)
    self.name = goods.name
    self.good_id = goods.id
    self.no = goods.no
    self.mk_price = goods.mk_price
    self.price = goods.price
    self.pdt_desc = goods.pdt_desc
    self.intor = goods.intro
    self.keywords = goods.keywords
    self.unit = goods.unit
    self.breif = goods.breif
    self.weight = goods.weight
  end
end
