class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :care

      t.timestamps
    end
  end
end
