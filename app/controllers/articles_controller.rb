class ArticlesController < ApplicationController
  def fetch_articles
    # Fetch the articles from CN API
    fetch_req = RestClient.get 'https://api.currentsapi.services/v1/latest-news', {authorization: ENV['API_TOKEN']}

    # Parse the JSON res
    latest_news = JSON(fetch_req.body)

    # Pick the first ten
    @first_ten = latest_news["news"].first(10)
    
    # Create authors in the PG db
    @first_ten.each do |current_article|
      
      # Find or Create author  and article
      author = Author.find_or_create_by(name: current_article["author"])
      Article.find_or_create_by(title: current_article["title"], url: current_article["url"], published_at: current_article["published"], language: current_article["language"], author_id: author.id) 
    end

    render json: @first_ten
  end

  def index
    @articles = Article.all.order('created_at DESC')
    render json: @articles
  end

  # GET /search
  def search
    @articles = Article.find_by(title: params[:query])
    render json: @articles
  end

  private
    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :url, :published_at)
    end
    def author_params
      params.require(:author).permit(:name)
    end

end
