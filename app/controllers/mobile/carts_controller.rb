class Mobile::CartsController < Mobile::BaseController
  def show
    @cart = Cart.find(params[:id])
  end

end