class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(animal_id: params[:animal_id])
    favorite.save
    redirect_to animals_path
  end

  def destroy
    favorite = Favorite.find_by(animal_id: params[:animal_id], user_id: current_user.id)
    favorite.destroy
    redirect_to animals_path
  end

  def show
   @animals = current_user.animals
   @favorite_animals = current_user.favorite_animals
  end
end
