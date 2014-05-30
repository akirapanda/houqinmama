class Admin::GoodsImagesController <  Admin::BaseController
  def create
    @imageable = find_imageable
    @goods_image = @imageable.goods_images.build(goods_images_params)
    @goods_image.user = current_user
    @success = @goods_image.save
    redirect_to [:admin,@imageable]
  end
  
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end
  
  def destroy
     @goods_image=GoodsImage.find(params[:id])
     @success=@goods_image.destroy
     redirect_to [:admin,@goods_image.imageable]
  end
  
  
  private
  
  
  def goods_images_params
    params.require(:goods_image).permit!
  end
  
  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end