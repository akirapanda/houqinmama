class Admin::CommentsController <  Admin::BaseController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @success = @comment.save
    redirect_to [:admin,@commentable]

  end
  
  def index
    
  end
  
  def destroy
     @comment=Comment.find(params[:id])
     @success=@comment.destroy
     redirect_to [:admin,@comment.commentable]
  end
  
  
  private
  
  
  def comment_params
    params.require(:comment).permit!
  end
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end