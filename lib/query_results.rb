class QueryResults
  def initialize(query = nil)
    @query = query
    @db = ActiveRecord::Base.connection
  end

  def results
    return @results if @results
    @db.transaction do
      begin
        dataset = @db.execute(@query)
        @results = { :fields => dataset.fields, :rows => dataset.entries }
      rescue Exception => ex
        message = ex.message.gsub("PG::Error: ERROR:  ", "").split("\n").first
        @results = { :error => message }
      end

      raise ActiveRecord::Rollback
    end

    @results
  end
end
