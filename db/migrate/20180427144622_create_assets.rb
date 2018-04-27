class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.text :address
      t.integer :square_maters
      t.string :cep
      t.string :type
      t.text :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
