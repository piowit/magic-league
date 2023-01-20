class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :name, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
