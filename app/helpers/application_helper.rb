module ApplicationHelper

  def challenges_by_topic(challenges)
    challenges.group_by(&:topic)
  end
  
end
