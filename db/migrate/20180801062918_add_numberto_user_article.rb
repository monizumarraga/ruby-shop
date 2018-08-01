class AddNumbertoUserArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :user_articles, :number, :integer
    add_column :user_articles, :price, :float
  end
end
