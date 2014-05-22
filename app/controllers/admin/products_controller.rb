class Admin::ProductsController <  Admin::BaseController
  
  def new
    if params[:goods_id].present?
      @product = Product.new
      @goods = Good.find(params[:goods_id])
      @product.build_with_goods(@goods )
    else
      redirect_to new_list_admin_products_path
    end
  end
  
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path,:notice=>"新建商品记录成功"
    else
      render 'new'
    end
  end
  
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path,:notice=>"更新商品记录成功"
    else
      render 'edit'
    end
  end
  
  def index
    @products = Product.all
    @products_grid = initialize_grid(@products,:per_page => 20)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new_list
    @q = Good.search(params[:q])
    @goods = @q.result(distinct: true)
    @goods_grid = initialize_grid(@goods,:per_page => 20)
  end
  
  private
  def product_params
    params.require(:product).permit!
  end
end