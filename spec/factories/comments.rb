FactoryGirl.define do

  factory :comment do
    comment             Faker::Lorem.sentence
    group_id            1
    user_id             1
  end

end
