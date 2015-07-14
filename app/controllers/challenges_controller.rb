class ChallengesController < ApplicationController

  before_action :load_challenge, :set_previous_results, only: [:show]

  def index
    @challenges = Challenge.all
    @progress = session.fetch(:challenge_id) {0}
  end

  def show
    @metadata = @challenge.schema
  end

  private

  def load_challenge
    @challenge = Challenge.find_by(id: params[:id])
  end

  def set_previous_results
    return unless previous_query?
    @last_query = Attempt.results_for(flash[:query])
    @expected = Attempt.results_for(@challenge.previous.query)
  end

end
