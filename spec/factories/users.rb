FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
      email
      name 'SomeUserName'
  end

end
