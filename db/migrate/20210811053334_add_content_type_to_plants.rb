class AddContentTypeToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :content_type, :string
  end
end
