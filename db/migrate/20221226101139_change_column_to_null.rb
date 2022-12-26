class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :img_url, true
  end
end
