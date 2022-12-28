class AddReferencesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :end_users
  end
end
