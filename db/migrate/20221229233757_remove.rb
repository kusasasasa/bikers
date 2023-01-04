class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :end_user_id, :integer
  end
end
