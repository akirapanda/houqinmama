class Mobile::HomeController < Mobile::BaseController
  def index
    @products = Product.on_sale
    if params[:open_id].present
      session[:open_id] = params[:open_id]
    end
  end
  
  def category
    
  end
  
end