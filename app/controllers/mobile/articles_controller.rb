class Mobile::ArticlesController < Mobile::BaseController
  def show
    @article = Article.find(params[:id])
  end
end