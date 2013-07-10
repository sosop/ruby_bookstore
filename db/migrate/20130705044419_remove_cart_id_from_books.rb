class RemoveCartIdFromBooks < ActiveRecord::Migration
  def up
    remove_column :books, :cart_id
  end

  def down
  end
end
