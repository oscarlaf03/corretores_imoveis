class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.string :logo
      t.string :banner
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
