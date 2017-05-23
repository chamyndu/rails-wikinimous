class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @articles = Article.new
  end

  def create
    # creating an article
    Article.create(article_params)
    # redirecting to index of articles
    redirect_to task_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to task_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to task_path
  end


  private

  def set_article
    @article = Article.find(find[:id])
  end

  def article_params
    # filtering/whitelisting the params that come in from the form
    params.require(:article).permit(:title, :content)
  end

end
