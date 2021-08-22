class Tag < ApplicationRecord
  has_many :animal_tag_relations
  has_many :animals, through: :animal_tag_relations

end
