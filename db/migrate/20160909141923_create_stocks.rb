class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :deposit, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.datetime :received_at
      t.integer :taxe

      t.timestamps
    end
  end
end
