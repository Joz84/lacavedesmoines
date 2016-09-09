class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :alcohol, foreign_key: true
      t.text :description
      t.references :brewery, foreign_key: true
      t.references :region, foreign_key: true
      t.string :country
      t.string :capacity
      t.references :kind, foreign_key: true
      t.references :color, foreign_key: true
      t.references :fermentation, foreign_key: true
      t.float :degree
      t.text :specificity
      t.boolean :returnable
      t.float :promotion
      t.integer :rating

      t.timestamps
    end
  end
end
