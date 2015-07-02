require 'rails_helper'

RSpec.describe Challenge, type: :model do
  context "#next" do

    let(:first_challenge) {create(:challenge)}
    let(:second_challenge) {create(:challenge)}

    it "returns the next challenge in the database" do
      expect(first_challenge.next.order).to eq second_challenge.order
    end

  end
end
