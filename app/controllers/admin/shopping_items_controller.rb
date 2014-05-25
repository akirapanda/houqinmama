class Admin::ShoppingItemsController <  Admin::BaseController
  
  def new
    @shopping_item = ShoppingItem.new
    product=Product.find(params[:shopping_item][:product_id])
    @shopping_item.product_id=product.id
    @shopping_item.name=product.name
    @shopping_item.price=product.price
  end
  
  def create
    @cart=current_cart
    @shopping_item = ShoppingItem.new(shopping_item_params)
    @success =  @shopping_item.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_item
      @shopping_item = ShoppingItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_item_params
      params.require(:shopping_item).permit!
    end
end