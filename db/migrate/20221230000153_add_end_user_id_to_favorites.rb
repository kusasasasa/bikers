class AddEndUserIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    def change
      add_reference :favorites, :enduser, foreign_key: true
    end
  end
end
