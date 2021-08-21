class AddColumnsToPlant < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :common_name, :string
    add_column :plants, :description, :text
  end
end
