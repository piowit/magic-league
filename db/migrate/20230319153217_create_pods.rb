class CreatePods < ActiveRecord::Migration[7.0]
  def change
    create_table :pods do |t|
      t.references :contest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
