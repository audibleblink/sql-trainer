require 'rails_helper'

describe ChallengesController do
  let!(:challenge) { build(:challenge) }

  describe "#index" do
    let(:challenges) { [challenge] }
    let(:progress) { 0 }

    it "displays the challenges in order" do
      expect(Challenge).to receive(:all) { challenges }
      expect(session).to receive(:fetch).with(:challenge_id) { progress }
      get :index
      expect(assigns(:challenges)).to eq challenges
      expect(assigns(:progress)).to eq progress
    end
  end

  describe "#show" do
    let(:metadata) { 'metadata' }

    before(:each) do
      allow(Challenge).to receive(:find_by) { challenge }
      allow(challenge).to receive(:schema) { metadata }
    end

    it "displays the challenges index page" do
      allow_any_instance_of(ApplicationController).to receive(:previous_query?) { false }
      get :show, id: 1
      expect(assigns(:challenge)).to eq challenge
      expect(assigns(:metadata)).to eq metadata
      expect(assigns(:last_query)).to be_nil
      expect(assigns(:expected)).to be_nil
    end

    it "sets the previous results" do
      results = 'query results'
      allow_any_instance_of(ApplicationController).to receive(:previous_query?) { true }
      allow(Attempt).to receive(:results_for) { results }
      get :show, id: 1
      expect(assigns(:last_query)).to eq results
      expect(assigns(:expected)).to eq results
    end
  end


end
