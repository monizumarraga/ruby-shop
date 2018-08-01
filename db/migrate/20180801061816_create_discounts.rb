class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :typedisocunt
      t.integer :quantity
      t.string :unitdiscount
      t.float :price

      t.timestamps
    end
  end
end
