class Animal < ApplicationRecord
  belongs_to :user
  has_many :animal_tag_relations
  has_many :tags, through: :animal_tag_relations
  has_many :comments
  has_one_attached :image



  def self.search(search)
    if search != ""
      Animal.where('tweet LIKE(?)', "%#{search}%")
    else
      Animal.all
    end
  end
end
