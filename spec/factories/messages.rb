FactoryGirl.define do

  factory :message do
    body { Faker::Lorem.paragraph }
    image { Faker::File.file_name('path/to') }
    group_id 1
    user_id 1
  end

end
