FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    category { %w[Property Family Finance Other].sample }  # adjust categories as needed
    status { 'open' }
    association :user  # assumes a user factory exists
  end
end
