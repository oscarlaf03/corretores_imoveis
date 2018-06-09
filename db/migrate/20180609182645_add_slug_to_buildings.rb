class AddSlugToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :slug, :string
  end
end
