class UsersController < ApplicationController

  def signin
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to attractins_show
    else
      render "signup"
    end
  end

  def logout
    
end
