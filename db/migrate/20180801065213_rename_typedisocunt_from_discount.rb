class RenameTypedisocuntFromDiscount < ActiveRecord::Migration[5.2]
  def change
    rename_column :discounts, :typedisocunt, :typediscount
  end
end
