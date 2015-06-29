require_relative "query_results"

class Attempt
  attr_reader :challenge, :query

  def initialize(params)
    @challenge = params[:challenge]
    @query = params[:query]
  end

  def is_correct?
    QueryResults.new(query).results == QueryResults.new(challenge.query).results
  end

end
