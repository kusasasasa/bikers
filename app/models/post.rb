class Post < ApplicationRecord
    belongs_to:end_user_id
    has_many:comments
    has_many:favorites
    has_many:post_tag_details
end
