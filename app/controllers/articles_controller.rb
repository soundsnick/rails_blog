class ArticlesController < ApplicationController
  def index
    @articles = Article.order(id: :desc)
  end

  def new
    if check_admin

    else
      redirect_to articles_path, notice: 'You are not an admin'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path, notice: 'Succesfully created'
  end

  def edit
    if check_admin
      id = params[:id]
      @article = Article.find(id)
    else
      redirect_to articles_path, notice: 'You are not an admin'
    end
  end

  def destroy
    if check_admin
      @article = Article.destroy(params[:id])
      redirect_to articles_path, notice: 'Succesfully deleted'
    else
      redirect_to articles_path, notice: 'You are not an admin'
    end
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
