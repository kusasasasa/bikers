class AddColumnFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :end_user, :integer
  end
end
