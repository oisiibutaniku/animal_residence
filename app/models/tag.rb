class Tag < ApplicationRecord
  has_many :animal_tag_relations
  has_many :animals, through: :animal_tag_relations

  validates :name, uniqueness: true

  def self.search(search)
    if search != '#'
      tag = Tag.where(name: search)
      tag[0].animals
    else
      Animals.all
    end
  end

end
