FactoryBot.define do
  factory :answer do
    response_text { "This is a sample answer." }
    proposed_fee { 20 }
    paid { false }
    association :user
    association :question
  end
end