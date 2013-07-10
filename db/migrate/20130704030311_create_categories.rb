class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,       null: false,default: '' 
      t.integer :publish_status,null: false,default: 0
      t.integer :priority,      null: false,default: 0

      t.timestamps
    end
  end
end
