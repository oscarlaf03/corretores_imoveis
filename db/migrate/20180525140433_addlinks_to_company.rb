class AddlinksToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :facebook, :string
    add_column :companies, :linkedin, :string
    add_column :companies, :twitter, :string
    add_column :companies, :instagram, :string
  end
end
