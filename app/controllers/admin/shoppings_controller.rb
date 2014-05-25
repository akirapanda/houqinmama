class Admin::ShoppingsController <  Admin::BaseController
  
  def index
    @q = Shopping.search(params[:q])
    @shoppings = @q.result(distinct: true)
    @shoppings_grid = initialize_grid(@shoppings,:include=>[:goods_cate],:per_page => 20)
  end


  def show
    @shopping = Shopping.find(params[:id])
  end
  
  def destroy
    @shopping = Shopping.find(params[:id]) 
    @shopping.destroy
    respond_to do |format|
      format.html { redirect_to admin_shoppings_url  ,notice: "订单# #{@shopping.id}已被删除"}
    end
  end
  
  def create
    @shopping = Shopping.new(shopping_params)
    

    @shopping.amount=@shopping.calAmount(@shopping)
    if @shopping.save
      flash[:notice] = "Successfully created project."
      redirect_to admin_shoppings_path
    else
      render :action => 'new'
    end
  end
  
  
  def update
        
    @shopping = Shopping.find(params[:id])
    shopping_params
    params[:shopping][:exist_shopping_item_attributes] ||= {}
    
    respond_to do |format|
      if @shopping.update(params[:shopping])
        @shopping.amount=@shopping.calAmount(@shopping)
        @shopping.save
        format.html { redirect_to [:admin,@shopping], notice: 'Shopping was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  
  
  def new
    @shopping = Shopping.new
  end
  
  def edit
    @shopping = Shopping.find(params[:id])
  end
  
  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_params
      params.require(:shopping).permit!
    end
end