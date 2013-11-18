class UsersController < ApplicationController

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
    @user = current_user
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

  #maybe we should put this in the commitments controller...
  def new_commitment
    @commitment = Commitment.new
    @user = current_user
    @score_weights = [5, 10, 15, 20 ]
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

end
