require 'rails_helper'

RSpec.describe Challenge, type: :model do
  context "#next" do

    let(:first_challenge) {Challenge.first}
    let(:second_challenge) {Challenge.second}

    it "returns the next challenge in the database" do
      expect(first_challenge.next).to eq second_challenge
    end

    it "returns false if called on the last quest" do
        # talks to shadi
    end

  end
end
