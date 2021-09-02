class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :animals,foreign_key: :user_id, dependent: :destroy
         has_many :favorites
         has_many :favorite_animals, through: :favorites, source: :animal 
         has_many :comments
         has_one_attached :image

         has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :follower

         has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :followings, through: :relationships, source: :followed

         with_options presence: true do
          validates :nickname

         end

         def follow(user_id)
          relationships.create(followed_id: user_id)
        end
        def unfollow(user_id)
          relationships.find_by(followed_id: user_id).destroy
        end
        def following?(user)
          followings.include?(user)
        end        
end
