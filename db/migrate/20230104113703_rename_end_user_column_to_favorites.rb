class RenameEndUserColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :end_user, :end_user_id
  end
end
