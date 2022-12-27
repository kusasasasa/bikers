class Post < ApplicationRecord
    belongs_to:end_user
    has_many:comments
    has_many:favorites
    has_many:post_tag_details
    # mount_uploader :img_url, ImgUrlUploader
    has_many_attached :img_urls
    validates :destination, presence: true
    validates :body, presence: true
    validates :address, presence: true
  
end
