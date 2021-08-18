class AnimalsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_animal, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]  
  def index
    @animals = Animal.includes(:user).order("created_at DESC")
  end

  def new
    @animal = Animal.new
  end

  def create
    Animal.create(animal_params)
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
  end

  def edit
    
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
  end
  
  def show
    @comment = Comment.new
    @comments = @animal.comments.includes(:user)
  end

  def search
    @animals = Animal.search(params[:keyword])
  end
  

  private
  def animal_params
    params.require(:animal).permit(:image, :text).merge(user_id: current_user.id)
  end
  
  def set_animal
    @animal = Animal.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end


