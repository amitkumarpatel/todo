FactoryBot.define do
  factory :page do
    title { Faker::Lorem.word }
    weburl { Faker::Internet.url }
  end
end