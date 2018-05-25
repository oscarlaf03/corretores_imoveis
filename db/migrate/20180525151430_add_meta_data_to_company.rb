class AddMetaDataToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :slogan, :text
    add_column :companies, :description, :text
  end
end
