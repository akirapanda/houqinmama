class Admin::GoodsController < Admin::BaseController
  def index
    @q = Good.search(params[:q])
    @goods = @q.result(distinct: true)
    @goods_grid = initialize_grid(@goods,:include=>[:goods_cate],:per_page => 20)
  end
  
  def show
    @goods = Good.find(params[:id])
  end
  
  def photo
    @goods = Good.find(params[:id])
    @goods_images_grid = initialize_grid(@goods.goods_images,:per_page => 20)
  end
  
  def new
    @goods = Good.new
  end
  
  def create
    @goods = Good.new(goods_params)
    if @goods.save
      redirect_to admin_goods_path,:notice=>"新建商品记录成功"
    else
      render 'new'
    end
  end
  
  def edit
    @goods = Good.find(params[:id])
  end
  
  def update
    @goods = Good.find(params[:id])
    if @goods.update(goods_params)
      redirect_to admin_goods_path,:notice=>"更新商品记录成功"
    else
      render 'edit'
    end
  end
  
  def destory
    @goods = Good.find(params[:id])
    @goods.destroy
    redirect_to admin_goods_path
  end

  private
  def goods_params
    params.require(:good).permit!
  end
end
