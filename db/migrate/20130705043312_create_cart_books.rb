class CreateCartBooks < ActiveRecord::Migration
  def change
    create_table :cart_books do |t|
      t.integer :book_id, null: false, default: 0 
      t.integer :cart_id, null: false, default: 0
      t.integer :num,     null: false, default: 0
      t.timestamps
    end
  end
end
