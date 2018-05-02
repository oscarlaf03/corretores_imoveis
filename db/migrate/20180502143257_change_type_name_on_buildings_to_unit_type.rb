class ChangeTypeNameOnBuildingsToUnitType < ActiveRecord::Migration[5.1]
  def change
    rename_column :buildings, :type, :unit_type
  end
end
