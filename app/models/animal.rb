class Animal < ApplicationRecord
  belongs_to :user
  has_many :animal_tag_relations,foreign_key: :animal_id, dependent: :destroy
  has_many :tags, through: :animal_tag_relations
  has_many :comments,foreign_key: :animal_id, dependent: :destroy
  has_many :favorites
  has_one_attached :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end



  def self.search(search)
    if search != ""
      Animal.where('tweet LIKE(?)', "%#{search}%")
    else
      Animal.all
    end
  end
end
