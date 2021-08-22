class AnimalsTag

  include ActiveModel::Model
  attr_accessor :image,:text, :name,:user_id

  with_options presence: true do
  end

  def save
    animal = Animal.create(text: text,image: image,user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    AnimalTagRelation.create(animal_id: animal.id, tag_id: tag.id)
  end

end