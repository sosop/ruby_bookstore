class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name,          null: false, default: ''
      t.text :description,     null: false, default: ''
      t.float :price,          null: false, default: 0.0
      t.integer   :publish_status, null: false, default: 0
      t.datetime :publish_date
      t.integer   :stock,          null: false, default: 1
      t.integer   :category_id,    null: false, default: 0
      t.timestamps
    end
  end
end
