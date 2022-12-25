class RenameProfileImgColumnToEndUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column  :end_users, :profile_img, :profile_image
  end
end
