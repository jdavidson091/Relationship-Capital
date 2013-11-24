class CommitmentsController < ApplicationController
  def create
    @commitment = Commitment.new(commitment_params)
    @user = current_user
    if @commitment.save
      @commitment.update_attribute(:creator_id, @user.id)
      @commitment.update_attribute(:date_made, Time.now)
      @commitment.update_attribute(:status, "Pending")
      flash[:success] = "New Commitment Created"
      render 'users/home'
    else
      render 'users/new_commitment'
    end
  end

  def new
    @currentUserRole = params[:role]
    @commitment = Commitment.new
    @user = current_user
    @score_weights = [5, 10, 15, 20 ]
  end

  def accept
    @commitment = Commitment.find(params[:id])
    @commitment.update_attribute(:status, "In Progress")
    flash[:success] = "Commitment Accepted!"
    redirect_to notifications_path
  end

  def update
    @commitment = Commitment.find(params[:id])
    if @commitment.update_attributes(commitment_params)
      #handles a successful update
      flash[:success] = "Commitment updated."
      redirect_to root_path
    else
      render 'settings'
    end
  end

  def feedback
  end

  def edit
    @user = current_user
    @commitment = Commitment.find(params[:id])
    @activeUser = User.find(@commitment.active_user_id)
    @supervisorUser = User.find(@commitment.overseer_user_id)
  end

  def destroy
    @commitment = Commitment.find(params[:id])
    @commitment.destroy
    redirect_to notifications_path

  end

  private
  def commitment_params
    params.require(:commitment).permit(:overseer_user_id, :description,
                                       :active_user_id, :status, :date_made, :date_end, :score_weight)
  end


end
