class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.order(:order)
  end

  def show
    @last_query = Attempt.results_for(flash[:query]) if flash[:query]
    @challenge  = Challenge.find_by(id: params[:id])
  end

end
