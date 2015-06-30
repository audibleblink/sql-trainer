module Attempt

  DB = ActiveRecord::Base.connection

  def self.is_correct?(query_attempt, challenge_query)
    results_for(query_attempt) == results_for(challenge_query)
  end

  def self.results_for(query)
    results = ""
    DB.transaction do
      begin
        dataset = DB.execute(query)
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
