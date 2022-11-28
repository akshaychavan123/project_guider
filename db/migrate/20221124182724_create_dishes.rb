class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :dishname
      t.integer :price
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
