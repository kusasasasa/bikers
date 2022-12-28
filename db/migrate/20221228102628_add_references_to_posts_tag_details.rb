class AddReferencesToPostsTagDetails < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :post_tag_details, :posts
    add_foreign_key :post_tag_details, :tags
  end
end
