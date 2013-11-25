class UsersController < ApplicationController
  #before the user can access the settings or update methods, they
  # must be signed in.
  before_action :signed_in_user, only: [:settings, :update]

  # default controller method that's called when
  # redirect to @user.
  # Make it so that if the user is signed in, render the homepage.
  def show
    @user = User.find(params[:id])
    #@commitments = Commitment.find_all_by_active_user_id(@user.id)
    @commitments = Commitment.where(active_user_id: @user.id)

    if self.current_user == @user
      render 'home'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update_attribute(:rc_score, 0)
      @user.update_attribute(:perception_score, 0)
      @user.update_attribute(:admin, false)

      sign_in @user
      flash[:success] = "Welcome to the application. Enjoy!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def home

  end

  def settings
    #@user = current_user
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #handles a successful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'settings'
    end
  end

  def notifications
    @user = current_user
  end

  def admin_home
    @user = current_user
    @performed_action = ""

  end

  def leaderboard
    @user = current_user
  end

  #destroy the user...
=begin
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
=end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:error] = "User deleted."
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def all_params
    params.require(:user).permit(:name, :email, :password,
                                 :rc_score)
  end

  def signed_in_user
    redirect_to signin_url, notice: "To access this page, please sign in!" unless signed_in?
  end

end
