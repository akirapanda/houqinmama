class Admin::UsersController <  Admin::BaseController
  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
    @users_grid = initialize_grid(@users,:per_page => 20)
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: '更新用户权限成功' }
      else
        format.html { render action: 'edit' }
      end
    end
    
  end
  
  private 
  
  def user_params
    params.require(:user).permit!
  end
end