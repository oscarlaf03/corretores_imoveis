class AddMobilePhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mobile_phone, :integer
    add_column :users, :username, :string
    add_column :users, :site_owner, :boolean, null: false, default: false


  end
end
