class AddPlaceToContest < ActiveRecord::Migration[7.0]
  def change
    add_column :contests, :place, :string
    change_column :contests, :date, :datetime
  end
end
