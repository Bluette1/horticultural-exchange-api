class AddAttachmentImageToPlants < ActiveRecord::Migration[6.1]
  def change
    add_attachment :plants, :image
  end
end
