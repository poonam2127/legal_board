# spec/models/question_spec.rb
require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { User.create(email: 'testuser@example.com', password: 'password') }

  it 'is valid with a title, body, and category' do
    question = Question.new(
      title: 'What is the new question?',
      body: 'I need legal advice on for this question.',
      category: 'Philosophy',
      user_id: user.id 
    )
    expect(question).to be_valid
  end

  it 'is invalid without a title' do
    question = Question.new(title: nil)
    expect(question).not_to be_valid
  end

  it 'is invalid without a body' do
    question = Question.new(body: nil)
    expect(question).not_to be_valid
  end

  it 'is invalid without a category' do
    question = Question.new(category: nil)
    expect(question).not_to be_valid
  end
end
