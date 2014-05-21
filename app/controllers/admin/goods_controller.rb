class Admin::GoodsController < Admin::BaseController
  def index
    @q = Good.search(params[:q])
    @goods = @q.result(distinct: true)
    @goods_grid = initialize_grid(@goods,:include=>[:goods_cate],:per_page => 20)
  end
end
