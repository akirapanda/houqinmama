class Admin::GoodsCatesController < Admin::BaseController
  def index
    @goods_cates = GoodsCate.all
    @goods_cates_grid = initialize_grid(@goods_cates,:per_page => 20)
  end
  
  def show
    
  end
  
  def new
    @goods_cates = GoodsCate.new
  end
  
  def create
    @goods_cates = GoodsCate.new(goods_cate_params)
    if @goods_cates.save
      redirect_to admin_goods_cates_path,:notice=>"新建商品分类信息成功"
    else
      render 'new'
    end
  end
  
  def edit
    @goods_cates = GoodsCate.find(params[:id])
  end
  
  def update
    @goods_cates = GoodsCate.find(params[:id])
    if @goods_cates.update(goods_cate_params)
      redirect_to admin_goods_cates_path,:notice=>"更新商品分类成功"
    else
      redirect_to 'edit'
    end
  end
  
  private
  def goods_cate_params
    params.require(:goods_cate).permit!
  end
end