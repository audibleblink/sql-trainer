class AttemptsController < ApplicationController

  def create
    challenge = Challenge.find_by(id: attempt_params[:challenge_id])
    valid_attempt = Attempt.is_correct?(attempt_params[:query], challenge.query)

    flash[:query] = attempt_params[:query]

    if valid_attempt
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
