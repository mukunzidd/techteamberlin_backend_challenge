class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :published_at

      t.timestamps
    end
  end
end
