class Mobile::HomeController < Mobile::BaseController
  def index
    @products = Product.on_sale.order("no asc")
    if params[:weichat_id].present?
      session[:open_id] = params[:weichat_id]
    end
  end
  
  def category
    
  end
  
end