class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :text))
		@article.save
		redirect_to articles_path, notice: "Succesfully created"
	end

	def edit
	id = params[:id]
		@article = Article.find(id)
	end

	def destroy
		@article = Article.destroy(params[:id])
		redirect_to articles_path, notice: "Succesfully deleted"
	end

	def update
	@article = Article.find(params[:id])
		@article.update_attributes(params.require(:article).permit(:title, :text))
		redirect_to articles_path, notice: "Article updated"
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
