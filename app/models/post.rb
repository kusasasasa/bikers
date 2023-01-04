class Post < ApplicationRecord
    belongs_to:end_user
    has_many:comments, dependent: :destroy
    has_many:favorites, dependent: :destroy
    has_many:post_tag_details,dependent: :destroy
    has_many :tags, through: :post_tag_details
    # mount_uploader :img_url, ImgUrlUploader
    has_many_attached :img_urls
    validates :destination, presence: true
    validates :body, presence: true
    validates :address, presence: true
    def save_tag(sent_tags)
        current_tags = self.tags.pluck(:name) unless self.tags.nil?
        old_tags = current_tags - sent_tags
        new_tags = sent_tags - current_tags
        old_tags.each do |old|
          self.post_tags.delete Tag.find_by(name: old)
        end
        new_tags.each do |new|
          new_post_tag = Tag.find_or_create_by(name: new)
          self.tags << new_post_tag
        end
    end
    
   def self.search(search) #self.はUser.を意味する
       if search
         where(['destination LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
       else
         all #全て表示させる
       end
   end
   def favorited_by?(enduser)
        favorites.exists?(end_user_id: end_user.id)
   end
  
end
