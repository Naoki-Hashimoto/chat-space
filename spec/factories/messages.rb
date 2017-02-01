FactoryGirl.define do

  factory :message do
    body "こんにちは！"
    image "hoge.png"
    group_id 1
    user_id 1
  end

end
