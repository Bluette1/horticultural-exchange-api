class AddInStockFlagToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :in_stock, :boolean, default: true
  end
end
