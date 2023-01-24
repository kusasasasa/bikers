class Tag < ApplicationRecord
    has_many :post_tag_details, dependent: :destroy, foreign_key: 'tag_id'
    has_many :posts, through: :post_tag_details
    validates :name, uniqueness: true, presence: true
    def self.search(search) #self.はTag.を意味する
        where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。 
    end
end
