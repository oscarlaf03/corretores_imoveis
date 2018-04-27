class RenameAssetsToBuildings < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :assets, :buildings
  end

  def self.down
    rename_table :trains, :assets
  end
end
