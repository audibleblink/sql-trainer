class Challenge < ActiveRecord::Base
  default_scope { order(:order) }

  def next
    self.class.find_by(order: order + 1)
  end

end
