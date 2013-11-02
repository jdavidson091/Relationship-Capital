class CommitmentsController < ApplicationController
  def create
    @commitment = Commitment.new(commitment_params)
    @user = current_user
    if @commitment.save

      flash[:success] = "New Commitment Created"
      render 'users/home'
    else
      render 'users/new_commitment'
    end
  end

  private
  def commitment_params
    params.require(:commitment).permit(:overseer_user_id, :description,
                                       :date_end, :score_weight)
  end
end
