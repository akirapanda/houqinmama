class HomeController < BaseController
  def index
    @cart=current_cart
  end

  
end
