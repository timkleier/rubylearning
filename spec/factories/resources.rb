FactoryBot.define do
  factory :resource do
    sequence(:title) { |n| "This#{n} is a title!" }
    url { Faker::Internet.url }
  end
end
