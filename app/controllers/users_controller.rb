class UsersController < ApplicationController

  # default controller method that's called when
  # redirect to @user.
  # Make it so that if the user is signed in, render the homepage.
  def show
    @user = User.find(params[:id])

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

end
