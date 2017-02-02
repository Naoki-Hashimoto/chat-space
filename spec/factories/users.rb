FactoryGirl.define do

  sample_password = Faker::Number.number(8)

  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              sample_password
    password_confirmation sample_password
  end

end