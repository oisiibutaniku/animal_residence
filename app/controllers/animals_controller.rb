class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end
  def new
    @animals = Animal.new
  end
  def create
    Animal.create(animal_params)
  end
  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :image, :text)
  end
end
