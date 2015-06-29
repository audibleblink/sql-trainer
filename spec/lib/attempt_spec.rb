require 'rails_helper'

describe Attempt do
  context "is_correct?" do

    let(:challenge) {Struct.new("Question", :query).new("select * from artists;")  }
    let(:good_attempt) {Attempt.new(query:"select * from artists;", challenge: challenge )}
    let(:bad_attempt) {Attempt.new(query:"bad query is bad", challenge: challenge )}

    it "returns true when resulting QueryResults objects match" do
      expect(good_attempt.is_correct?).to be true
    end

    it "returns false when resulting QueryResults objects do not match" do
      expect(bad_attempt.is_correct?).to be false
    end

  end
end
