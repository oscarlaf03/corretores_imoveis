class AddBuildingIdToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :building_id, :integer
  end
end
