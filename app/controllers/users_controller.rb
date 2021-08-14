class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @animals = current_user.animals
  end

  def edit
    user = User.find(params[:id])
  end

end
