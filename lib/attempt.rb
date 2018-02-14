module Attempt

  def self.is_correct?(query_attempt, challenge_query)
    results_for(query_attempt) == results_for(challenge_query)
  end

  def self.results_for(query)
    results = ""
    ActiveRecord::Base.connection.transaction do
      begin
        dataset = ActiveRecord::Base.connection.execute(query)
        results = { :fields => dataset.fields, :rows => dataset.entries }
      rescue Exception => ex
        message = ex.message.gsub("PG::Error: ERROR:  ", "").split("\n").first
        results = { :error => message }
      end

      raise ActiveRecord::Rollback
    end

    results
  end

end
