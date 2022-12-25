class RemoveProfileImgFromEndUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :end_users, :profile_img, :string
  end
end
