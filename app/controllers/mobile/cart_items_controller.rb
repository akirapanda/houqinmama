class Mobile::CartItemsController < Mobile::BaseController
  def create
    if params[:cart_item][:quantity].present? && params[:cart_item][:product_id].to_i > 0
      @cart_item = CartItem.new(cart_item_params)
      @product = Product.find(@cart_item.product_id)
      if @product.on_sale == false
        @success = false
      end
      
      @cart_item.build_with_product(@product)
      @cart_item = current_cart.add_item(@cart_item)
      @success = @cart_item.save
    else
       @success =false
    end
  end
  
  def destroy
    @success = false
    @cart_item = CartItem.find(params[:id])
    @success = @cart_item.destroy
  end
  
  
  def plus
    @success = false
    if params[:quantity].present? && params[:quantity].to_i > 0
      @cart_item = CartItem.find(params[:id])
      @cart_item.quantity+=params[:quantity].to_i
      @cart_item.cal_amount
      @cart = @cart_item.cart
      @success = @cart_item.save
    end
  end
  
  def minus
    @success = false
    if params[:quantity].present? && params[:quantity].to_i > 0
      @cart_item = CartItem.find(params[:id])
      @cart_item.quantity-=params[:quantity].to_i if @cart_item.quantity>1
      @cart_item.cal_amount
      @success = @cart_item.save
    end
  end
  
  
  
  private 
  
  def cart_item_params
    params.require(:cart_item).permit!
  end
  
end