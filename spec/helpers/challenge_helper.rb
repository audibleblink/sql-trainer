module ChallengeHelper
  def stub_last_challenge challenge
    allow_any_instance_of(ApplicationController).to receive(:last_challenge) { challenge }
  end
end
