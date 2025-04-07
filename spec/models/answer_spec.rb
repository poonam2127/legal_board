# spec/models/answer_spec.rb
require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:user) { User.create(email: 'testuser@example.com', password: 'password') }
  let(:question) { Question.create(title: 'This is my question', body: 'here is description', category: "Wills & Probate", user: user) }

  it 'is valid with a response text and proposed fee' do
    answer = Answer.new(
      response_text: 'I recommend signing a contract.',
      proposed_fee: 20.0,
      user_id: user.id,  
      question_id: question.id
    )
    expect(answer).to be_valid
  end

  it 'is invalid without response_text' do
    answer = Answer.new(response_text: nil)
    expect(answer).not_to be_valid
  end

  it 'is invalid without a proposed_fee' do
    answer = Answer.new(proposed_fee: nil)
    expect(answer).not_to be_valid
  end
end
