require 'rails_helper'

describe ChallengesController do

  describe "#index" do
    it "displays the challenges in order" do
      get :index
      challenge_order = assigns[:challenges].map(&:order)
      expect(challenge_order).to eq Challenge.pluck(:order).sort
    end
  end

  describe "#show" do
    let(:challenge) {create(:challenge)}

    it "displays the challenges index page" do
      get :show, id: challenge.id
      expect(response.status).to eq 200
    end
  end


end
