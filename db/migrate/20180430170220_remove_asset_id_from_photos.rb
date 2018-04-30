class RemoveAssetIdFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :asset_id
  end
end
