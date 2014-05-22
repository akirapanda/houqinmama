class Mobile::HomeController < Mobile::BaseController
  def index
    @products = Product.on_sale
  end
  
  def category
    
  end
  
end