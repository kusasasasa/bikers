class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, id: :integer do |t|
      t.integer :post_id,              null: false
      t.string :title,          null: false
      t.string :body,          null: false
      t.timestamps
    end
  end
end
