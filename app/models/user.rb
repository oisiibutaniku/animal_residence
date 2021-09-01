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

         with_options presence: true do
          validates :nickname
         end
        
end
