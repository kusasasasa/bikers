class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:posts, dependent: :destroy
  has_many:favorites, dependent: :destroy
   has_many :comments, dependent: :destroy
  has_one_attached :profile_image
  validates :nickname, presence: true
  validates :email, presence: true
  validates :profile_image, presence: true
  validates :age, numericality: { only_integer: true }

end
