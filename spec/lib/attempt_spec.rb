require 'rails_helper'

describe Attempt do

  let(:good_query) {"select * from artists;"}
  let(:bad_query) {"bad query is bad"}

  context "#is_correct?" do

    let(:challenge) {Struct.new("Question", :query).new("select * from artists;")  }

    it "returns true when resulting QueryResults objects match" do
      expect(Attempt.is_correct?(challenge.query, good_query)).to be true
    end

    it "returns false when resulting QueryResults objects do not match" do
      expect(Attempt.is_correct?(challenge.query, bad_query)).to be false
    end

  end

  context "#results_for" do

    it "returns a valid response for a valid query" do
      expect(Attempt.results_for(good_query)).to have_key :fields
    end

    it "returns an for an invalid query" do
      expect(Attempt.results_for(bad_query)).to have_key :error
    end

  end

end
