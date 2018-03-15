class SearchController < ApplicationController
  def index
    @params = request.query_parameters
    @articles = ArticlesController::Article.search(params[:query])
    render '/articles/index'
  end
end