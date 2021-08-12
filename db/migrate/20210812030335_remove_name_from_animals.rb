class RemoveNameFromAnimals < ActiveRecord::Migration[6.0]
  def change
    remove_column :animals, :name, :string
  end
end
