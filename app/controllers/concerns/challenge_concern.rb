module ChallengeConcern
  extend ActiveSupport::Concerns

  def last_challenge
    @last_challenge ||= Challenge.find_by(order: session[:challenge_id])
  end

  def previous_query?
    flash[:query].present?
  end

end
