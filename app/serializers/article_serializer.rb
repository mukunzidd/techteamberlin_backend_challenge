class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :language, :published_at
  has_one :author
end
