class HomePagesController < ApplicationController
  def home
    if signed_in?
      @user = @current_user
      render 'users/home'
    end
  end

  def help
  end

end
