class Mobile::ShoppingsController < Mobile::BaseController
  def new
    @shopping = Shopping.new
    @shopping.cart_id = params[:cart_id]
    @cart = Cart.find(params[:cart_id])
    if @cart.cart_items.empty?
      redirect_to [:mobile,@cart],:alert=>'购物车中没有任何商品'
    end
  end
  
  def show
    @shopping = Shopping.find(params[:id])
  end

  def create
    @shopping = Shopping.new(shopping_params)
    @shopping.status = Shopping::NEW_STATUS
    cart = Cart.find(@shopping.cart_id)
    
    @shopping.build_with_cart(cart)
    @shopping.amount=@shopping.calAmount(@shopping)
    if session[:open_id]
      @shopping.open_id = session[:open_id]
    end
    
    if @shopping.save
      session[:cart_id]=nil
      redirect_to [:mobile,@shopping],:notice=>"下单成功"
    else
      render 'new'
    end
  end


  def history
    if session[:open_id].nil?
      redirect_to mobile_root_path,:notice=>"无微信账号信息，请关闭网页重新从微信中打开"
      return
    end
    
    @shoppings = Shopping.where("open_id = ?",session[:open_id]).page params[:page]
  end

  private
  
  def shopping_params
    params.require(:shopping).permit!
  end
  
end