class CreateMembershipsPods < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships_pods do |t|
      t.references :pod, null: false, foreign_key: true
      t.references :membership, null: false, foreign_key: true
      t.integer :place
      t.integer :points
      t.string :commander_name

      t.timestamps
    end
  end
end
