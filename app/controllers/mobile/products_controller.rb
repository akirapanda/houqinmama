class Mobile::ProductsController < Mobile::BaseController
  def index
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def product_cate
    if params[:cate_id].present?
      @products = Product.includes(:good).where("goods.goods_cate_id=?",params[:cate_id]).page params[:page]
    else
      @products = Product.all.page params[:page]
    end
  end
end