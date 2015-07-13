module ChallengeConcern
  extend ActiveSupport::Concerns

  def last_challenge
    Challenge.find_by(order: session[:challenge_id])
  end

  def next_challenge
    @next_challenge ||= session[:challenge_id] ? last_challenge.next : Challenge.first
  end

  def previous_query?
    flash[:query].present?
  end

end
