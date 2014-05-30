class ProductsController < BaseController
  def show
    @product = Product.find(params[:id])
  end
  
  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true).order("no asc")
    
    if params[:main_cate_id].present?
      @products = @products.joins(:goods_cate).where("goods_cates.parent_goods_cate_id=?",params[:main_cate_id])
    end
    
  end
end