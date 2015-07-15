class Challenge < ActiveRecord::Base
  default_scope { order(:order) }
  store_accessor :metadata, :tables, :topic

  def next
    self.class.find_by(order: order + 1)
  end

  def previous
    self.class.find_by(order: order - 1) || Challenge.first
  end

  def schema
    tables.map do |table_name|
      TableInfo.schema_for(table_name)
    end
  end

end
