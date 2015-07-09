class Challenge < ActiveRecord::Base
  default_scope { order(:order) }
  store :metadata, accessors: ["tables"]

  def next
    self.class.find_by(order: order + 1)
  end

  def previous
    self.class.find_by(order: order - 1)
  end

  def schema
    tables.map do |table_name|
      TableInfo.schema_for(table_name)
    end
  end

end
