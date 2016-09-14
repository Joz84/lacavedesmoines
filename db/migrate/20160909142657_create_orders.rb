class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :deposit, foreign_key: true
      t.references :user, foreign_key: true
      t.string :delivery
      t.string :address
      t.string :complement
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :telephone
      t.string :advancement

      t.timestamps
    end
  end
end
