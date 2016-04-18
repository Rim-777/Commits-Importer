FactoryGirl.define do
  sequence :sha do |n|
    "f6b9866d4a50f5452d8cac09a4211d615a327f7#{n}e"
  end
  factory :commit do
    date '2015-05-06 21:00:53 UTC'
    sha
    message 'SomeMesage'
  end

end
