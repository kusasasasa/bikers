class ChangeDatatypeProfileImageOfEndUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :end_users, :profile_image, :string
  end
end
