class AddFileNameToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :filename, :string
  end
end
