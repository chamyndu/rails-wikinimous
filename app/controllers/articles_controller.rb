class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    # creating an article
    Article.create(article_params)
    # redirecting to index of articles
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # filtering/whitelisting the params that come in from the form
    params.require(:article).permit(:title, :content)
  end

end
