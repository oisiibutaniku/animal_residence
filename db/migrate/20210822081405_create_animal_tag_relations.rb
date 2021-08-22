class CreateAnimalTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_tag_relations do |t|
      t.references :animal, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
