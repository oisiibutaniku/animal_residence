class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.references :user,           null: false, foreign_key: true
      t.text       :tweet,          null: false
      t.timestamps
    end
  end
end
