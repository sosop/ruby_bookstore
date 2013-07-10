class RemoveBookIdFromCarts < ActiveRecord::Migration
  def up
    remove_column :carts, :book_id
  end

  def down
  end
end
