class CreateContests < ActiveRecord::Migration[7.0]
  def change
    create_table :contests do |t|
      t.date :date
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
