class AddNameToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :end_user_id, :integer
  end
end
