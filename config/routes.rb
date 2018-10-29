Rails.application.routes.draw do
  # Fetch the 10 latest articles and store then in the db
  get '/fetch_articles' => 'articles#fetch_articles'

  # Get All Articles
  get '/articles' => 'articles#index'

  # Artcile by one particular Author [:id]
  get '/authors/:id/articles' => 'authors#articles'

  # Search articles by a "query" string
  get '/search' => 'articles#search'
end
