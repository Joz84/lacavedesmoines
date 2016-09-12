class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :complement, :string
    add_column :users, :postal_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :siret, :string
    add_column :users, :telephone, :string
  end
end
