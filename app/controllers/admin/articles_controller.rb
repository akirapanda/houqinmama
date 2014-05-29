class Admin::ArticlesController <  Admin::BaseController
  def index
    @q = Article.search(params[:q])
    @articles = @q.result(distinct: true)
    @articles_grid = initialize_grid(@articles,:per_page => 20)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to [:admin,@article],:notice=>"新建文章成功!"
    else
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id]) 
  end
  
  def update
    @article = Article.find(params[:id]) 
    if @article.update(article_params)
      redirect_to [:admin,@article],:notice=>"更新文章成功"
    else
      render 'edit'
    end
  end
  
  def destory
    @article = Article.find(params[:id]) 
    @article.destroy
    redirect_to admin_articles_path
  end
  
  private
  def article_params
    params.require(:article).permit!
  end
end