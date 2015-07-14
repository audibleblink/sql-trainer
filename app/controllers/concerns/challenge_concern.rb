module ChallengeConcern
  extend ActiveSupport::Concerns

  def previous_query?
    flash[:query].present?
  end

end
