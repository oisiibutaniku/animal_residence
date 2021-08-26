class AnimalsTag

  include ActiveModel::Model
  attr_accessor :image,:tweet, :name,:user_id

  with_options presence: true do
    validates :user_id
    validates :image  
  end
  validates :tweet, length: { maximum: 75 } 


  def save
    animal = Animal.create(tweet: tweet,image: image,user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    AnimalTagRelation.create(animal_id: animal.id, tag_id: tag.id)
  end

end