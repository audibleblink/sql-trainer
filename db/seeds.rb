require 'json'

path = File.expand_path("../challenge_seeds.json", __FILE__)
data = JSON.parse(File.read(path))

def create_challenges(data)
  data["values"].each do |values|
    params = Hash[data["fields"].zip(values)]
    Challenge.create!(params)
  end
end

create_challenges(data)
