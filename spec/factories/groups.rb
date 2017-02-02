FactoryGirl.define do

  sample_time = Faker::Time.between(2.days.ago, Time.now, :all)

  factory :group do
    name { Faker::Lorem.word }
    created_at sample_time
    updated_at sample_time
  end

end
