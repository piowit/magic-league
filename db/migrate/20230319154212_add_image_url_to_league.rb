class AddImageUrlToLeague < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :image_url, :string
    add_column :leagues, :rules, :text
  end
end
