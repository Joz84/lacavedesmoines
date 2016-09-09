class CreateAlcohols < ActiveRecord::Migration[5.0]
  def change
    create_table :alcohols do |t|
      t.string :name

      t.timestamps
    end
  end
end
