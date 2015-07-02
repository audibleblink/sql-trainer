class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
    @progress = session.fetch(:challenge_id, 0)
  end

  def show
    @last_query = Attempt.results_for(flash[:query]) if flash[:query]
    @challenge  = Challenge.find_by(id: params[:id])
  end

end
