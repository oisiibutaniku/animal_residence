class Animal < ApplicationRecord
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != ""
      Animal.where('text LIKE(?)', "%#{search}%")
    else
      Animal.all
    end
  end
end
