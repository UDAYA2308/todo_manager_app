class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    rename_column :users, :name, :first_name
    rename_column :users, :password, :password_digest
  end
end
