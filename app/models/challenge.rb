class Challenge < ActiveRecord::Base

  def next
    self.class.where("id > ?", id).first
  end

end
