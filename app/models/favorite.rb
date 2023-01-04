class Favorite < ApplicationRecord
    belongs_to:post
    belongs_to:end_user
    validates_uniqueness_of :post_id, scope: :end_user
end
