class CreateFermentations < ActiveRecord::Migration[5.0]
  def change
    create_table :fermentations do |t|
      t.string :name
      t.string :sku
      t.timestamps
    end
  end
end
