class AttemptsController < ApplicationController

  def create
    challenge = Challenge.find_by(id: attempt_params[:challenge_id])
    valid_attempt = Attempt.is_correct?(attempt_params[:query], challenge.query)

    flash[:query] = attempt_params[:query]

    if valid_attempt
      flash[:notice] = "Correct!"
      session[:challenge_id] = challenge.id
      redirect_to challenge.next ? challenge.next : root_path
    else
      flash[:alert] = "Incorrect"
      redirect_to challenge
    end

  end

  def reset
    session.clear
    redirect_to root_path
  end

  private

  def attempt_params
    params.require(:attempt).permit(:query, :challenge_id)
  end

end
