class CreateKinds < ActiveRecord::Migration[5.0]
  def change
    create_table :kinds do |t|
      t.string :name
      t.string :sku
      t.timestamps
    end
  end
end
