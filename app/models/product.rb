class Product < ActiveRecord::Base
  belongs_to :good
  validates :name, :no,:presence => true
  
  scope :on_sale, -> { where(on_sale: true) }
  paginates_per 10
  
  def build_with_goods(goods)
    self.name = goods.name
    self.good_id = goods.id
    self.no = goods.no
    self.mk_price = goods.mk_price
    self.price = goods.price
    self.pdt_desc = goods.pdt_desc
    self.intro = goods.intro
    self.keywords = goods.keywords
    self.unit = goods.unit
    self.brief = goods.brief
    self.weight = goods.weight
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
