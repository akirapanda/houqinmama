class Admin::ShoppingsController <  Admin::BaseController
  
  def index
    @q = Shopping.search(params[:q])
    @shoppings = @q.result(distinct: true)
    @shoppings_grid = initialize_grid(@shoppings,:include=>[:goods_cate],:per_page => 20)
  end

end