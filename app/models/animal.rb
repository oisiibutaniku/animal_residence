class Animal < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  def self.search(search)
    if search != ""
      Animal.where('text LIKE(?)', "%#{search}%")
    else
      Animal.all
    end
  end
end
