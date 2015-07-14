module ApplicationHelper

  def challenges_by_topic(challenges)
    challenges.group_by(&:topic)
  end

  def progress_value
    @progress.to_f / @challenges.count.to_f
  end

  def start_button_text
    is_new_user ? "Start" : "Continue"
  end

  def is_new_user
    @progress == 0
  end

  def last_challenge
    Challenge.find_by(order: session[:challenge_id])
  end

  def next_challenge
    session[:challenge_id] ? last_challenge.next : Challenge.first
  end
end
