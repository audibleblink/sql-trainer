FactoryGirl.define do

  sequence :order_number do |n|
    "#{n}"
  end

  factory :challenge do
    instructions "select a thing"
    query  "select * from things limit 1"
    order { generate(:order_number) }
  end

end
