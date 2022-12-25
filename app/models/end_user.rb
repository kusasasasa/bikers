class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:posts
  has_many:favorites
  has_one_attached :profile_image
  mount_uploader :profile_image, ProfileImageUploader

end
