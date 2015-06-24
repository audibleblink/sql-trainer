require 'rails_helper'

describe QueryResults do

  context "#results" do
    let(:good_query) {QueryResults.new("select * from artists")}
    let(:bad_query)  {QueryResults.new("select * from pandas")}

    it "returns a valid response for a valid query" do
      expect(good_query.results).to have_key :fields
    end

    it "returns an error for an invalid query" do
      expect(bad_query.results).to have_key :error
    end

  end
end
