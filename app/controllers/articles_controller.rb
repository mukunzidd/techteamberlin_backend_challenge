class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # POST /fetch_articles from current News API
  def fetch
    # Fetch the articles from CN API
    @current_news = RestClient.get 'https://api.currentsapi.services/v1/latest-news', {authorization: ENV['API_TOKEN']}

    @all_recent_articles = @current_news

    render json: @all_recent_articles, status: :ok
    # Pick the first ten
    # Create authors in the PG db
    # Store the ten articles in the PG db
  end

  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /by_author
  def search
    render status: :ok
  end

  # GET /by_author
  def by_author
    render status: :ok
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :url, :published_at)
    end
end
