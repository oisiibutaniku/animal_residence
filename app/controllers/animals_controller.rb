class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end
  def new
    @animals = Animal.new
  end
end
