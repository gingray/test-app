class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :publish_date
      t.timestamps
    end
  end
end
