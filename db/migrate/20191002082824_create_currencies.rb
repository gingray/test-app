class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.references :day
      t.string :iso_code
      t.text :name
      t.decimal :rate
      t.timestamps
    end
  end
end
