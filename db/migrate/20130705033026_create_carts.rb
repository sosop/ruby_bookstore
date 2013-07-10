class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :num,     null: false, default: 0
      t.integer :book_id, null: false, default: 0
      t.timestamps
    end
  end
end
