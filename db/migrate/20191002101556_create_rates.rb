class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :day
      t.string :iso_code
      t.text :name
      t.decimal :currency_rate
      t.timestamps
    end
  end
end
