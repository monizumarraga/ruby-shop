class AddDiscountRefToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :discount, foreign_key: true
  end
end
