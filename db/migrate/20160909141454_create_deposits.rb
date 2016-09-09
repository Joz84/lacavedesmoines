class CreateDeposits < ActiveRecord::Migration[5.0]
  def change
    create_table :deposits do |t|
      t.string :name
      t.string :address
      t.string :complement
      t.integer :postal_code
      t.string :city
      t.string :country
      t.integer :capacity
      t.string :siret

      t.timestamps
    end
  end
end
