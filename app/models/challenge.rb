class Challenge < ActiveRecord::Base

  def next
    self.class.find_by(order: order + 1)
  end

end
