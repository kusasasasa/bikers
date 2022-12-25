class AddProfileImgToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :profile_img, :binary
  end
end
