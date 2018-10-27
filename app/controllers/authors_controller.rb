class AuthorsController < ApplicationController
  # GET author's articles
  def articles
    @articles = Article.find_by(id: params[:id])
    render json: @articles
  end
end
