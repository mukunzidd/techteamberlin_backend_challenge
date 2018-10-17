class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :set_author, only: [:show, :update, :destroy]

  # Fetch the articles from CN API
  def fetch
    @fetch_req = RestClient.get 'https://api.currentsapi.services/v1/latest-news', {authorization: ENV['API_TOKEN']}

    # Parse the JSON res
    @latest_news = JSON(@fetch_req.body)

    # Pick the first ten
    @first_ten = @latest_news["news"].first(10)
    
    # Create authors in the PG db
    @first_ten.each do |current_article|
      # Create an author
      @author_name = current_article["author"]
      @author = Author.create(name: @author_name)
      current_author = Author.find_by(name: @author_name)

      # Create article
      @author_id = current_author.id
      @article = Article.create(title: current_article["title"], url: current_article["url"], published_at: current_article["published"], language: current_article["language"], author_id: @author_id) 
    end

    render json: @first_ten
  end

  def index
    @articles = Article.all
    render json: @articles
  end

  # GET /by_author
  def by_author
    id = params[:id]
    @articles = Article.find_by(id: id)
    if @articles
      render json: @articles
    else
      render json: {}
    end
  end

  # GET /search
  def search
    render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :url, :published_at)
    end
    def author_params
      params.require(:author).permit(:name)
    end

end
