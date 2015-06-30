require 'rails_helper'

describe AttemptsController do

  let(:challenge) {create(:challenge)}

  describe "#create" do
    it "sets correct flash message when user is correct" do
      post :create, {attempt: {query: "select * from invoices", challenge_id: 1}}
      expect(flash[:notice]).to eq "Correct!"
    end

    it "sets correct flash message when user is incorrect" do
      post :create, attempt: {query: "bad query", challenge_id: 1}
      expect(flash[:alert]).to eq "Incorrect"
    end
  end


end
