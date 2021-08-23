class AnimalsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_animal, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]  
  def index
    @animals = Animal.includes(:user).order("created_at DESC")
  end

  def new
    @animal_tag = AnimalsTag.new
  end

  def create
    @animal_tag = AnimalsTag.new(animal_params)
    if @animal_tag.valid?
      @animal_tag.save
       redirect_to root_path
    else
      render :new
    end
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
    if (params[:keyword])[0] == '#'
      @animals = Tag.search(params[:keyword]).order('created_at DESC')
    else
      @animals = Animal.search(params[:keyword]).order('created_at DESC')
  end
end
  

  private
  def animal_params
    params.require(:animals_tag).permit(:image, :text, :name).merge(user_id: current_user.id)
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


