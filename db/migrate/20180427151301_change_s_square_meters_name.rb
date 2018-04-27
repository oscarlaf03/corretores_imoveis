class ChangeSSquareMetersName < ActiveRecord::Migration[5.1]
  def change
    rename_column :assets, :square_maters, :square_meters
  end
end
