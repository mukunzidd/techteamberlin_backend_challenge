# README

This is a current news API that fetches new articles and stores then in a PostgreSQL database and you can search fromt he saves articles or get a list of farticles by an specific author.

This JSON API is built with Ruby on Rails.

## API endpoints

#### Fetch the 10 latest articles and store then in the db

`get '/fetch_articles' => 'articles#fetch'`

> Example `localhost:3000/fetch_articles`

#### Get All Articles

`get '/articles' => 'articles#index'`

> Example `localhost:3000/articles`

#### Artcile by one particular Author [:id]

`get '/authors/:id/articles' => 'articles#by_author'`

> Example `localhost:3000/authors/3/articles`

#### Search articles by a "query" string

`get '/search' => 'articles#search'`

> Example `ocalhost:3000/search?query='Best new drama' coming out of Britain, Brazil`

#### Installations

- Get Ruby at least `version 2.5.0` or newer
- Make sure you have the latest version of bundler installed and install Rails at least `version 5.0` or newer
- Make sure you have Postgresql installed
- Last but not least make sure you have the git installed locally

## Running the app

- Clone the repo
- Create a .env file
- Get an API token key from https://currentsapi.services
- Store the API key in a variable called `API_TOKEN` in `.env` file, as `API_TOKEN=[API_KEY]`
- Run `bundle install`
- Create the Postgres database by running `rails db:create`. This will create two databases called `current-nuz_development` and `current-nuz_test` which has a username of _current-nuz_.
- Run the migrations with `rails db:migrate`
- Run `rails server`
- You will be able to access the app on `localhost:3000` through Postman or similar tool

**Created with Love by _Dodo_**
