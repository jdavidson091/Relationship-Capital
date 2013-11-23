class CommitmentsController < ApplicationController
  def create
    @commitment = Commitment.new(commitment_params)
    @user = current_user
    if @commitment.save
      @commitment.update_attribute(:active_user_id, @user.id)
      @commitment.update_attribute(:creator_id, @user.id)
      @commitment.update_attribute(:date_made, Time.now)
      @commitment.update_attribute(:status, "Pending")
      flash[:success] = "New Commitment Created"
      render 'users/home'
    else
      render 'users/new_commitment'
    end
  end

  def feedback

  end

  def edit

  end

  private
  def commitment_params
    params.require(:commitment).permit(:overseer_user_id, :description,
                                       :active_user_id, :status, :date_made, :date_end, :score_weight)
  end
end
