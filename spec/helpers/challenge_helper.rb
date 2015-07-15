module ChallengeHelper
  def stub_next_challenge challenge
    allow_any_instance_of(ApplicationController).to receive(:next_challenge) { challenge }
  end
end
