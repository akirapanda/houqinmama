class Mobile::HomeController < Mobile::BaseController
  def index
    @products = Product.on_sale.order("no asc")

  end
  
  def category
    
  end
  
end