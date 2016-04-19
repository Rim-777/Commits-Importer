FactoryGirl.define do
  sequence :sha do |n|
    "f6b9866d4a50f5452d8cac09a4211d615a327f7#{n}e"
  end
  factory :commit do
    date '2014-10-10 18:09:29 +0300'
    sha
    message 'SomeMesage'
  end

end
