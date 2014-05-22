class Mobile::ShoppingsController < Mobile::BaseController
  def new
    @shopping = Shopping.new
    @shopping.cart_id = params[:cart_id]
  end
  
  def show
    @shopping = Shopping.find(params[:id])
  end

  def create
    
    @shopping = Shopping.new(shopping_params)
    cart = Cart.find(@shopping.cart_id)
    
    @shopping.build_with_cart(cart)
    if @shopping.save
      session[:cart_id]=nil
      redirect_to [:mobile,@shopping],:notice=>"下单成功"
    else
      render 'new'
    end
  end


  private
  
  def shopping_params
    params.require(:shopping).permit!
  end
  
end