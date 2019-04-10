FactoryBot.define do
  factory :element do
    title { Faker::Lorem.word }
    content { Faker::RealText.realText }
  end
end