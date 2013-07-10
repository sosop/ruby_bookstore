class AddCartIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :cart_id, :integer, null: false, default: 0
  end
end
