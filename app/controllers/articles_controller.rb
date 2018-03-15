class ArticlesController < ApplicationController
  def index
    @articles = Article.order(id: :desc)
  end

  def new; end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path, notice: 'Succesfully created'
  end

  def edit
    id = params[:id]
    @article = Article.find(id)
  end

  def destroy
    @article = Article.destroy(params[:id])
    redirect_to articles_path, notice: 'Succesfully deleted'
  end

  def search
    @params = request.query_parameters
    @articles = Article.search(params[:query])
    render '/articles/index'
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    redirect_to articles_path, notice: 'Article updated'
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
