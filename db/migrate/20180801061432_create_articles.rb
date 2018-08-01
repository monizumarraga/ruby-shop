class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :code
      t.string :name
      t.integer :units
      t.float :price

      t.timestamps
    end
  end
end
