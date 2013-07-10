class RemoveNumFromCarts < ActiveRecord::Migration
  def up
    remove_column :carts,:num
  end

  def down
  end
end
