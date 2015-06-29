class AttemptsController < ApplicationController

  def create
    challenge = Challenge.find_by(id: attempt_params[:challenge_id])
    attempt = Attempt.new(attempt_params.merge({challenge: challenge}))

    if attempt.is_correct?
      flash[:notice] = "Correct!"
      redirect_to challenge.next
    else
      flash[:alert] = "Incorrect"
      redirect_to challenge
    end

  end

  private

  def attempt_params
    params.require(:attempt).permit(:query, :challenge_id)
  end

end
