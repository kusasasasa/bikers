class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :end_user_id,              null: false
      t.string :destination,          null: false
      t.string :body,          null: false
      t.string :img_url,          null: false
      t.string :address,          null: false
      t.timestamps
    end
  end
end
