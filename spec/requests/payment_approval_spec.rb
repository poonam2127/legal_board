# spec/features/payment_approval_spec.rb
require 'rails_helper'
require 'devise'

RSpec.describe "PaymentApproval", type: :request do
  let(:user) { create(:user) }
  let(:lawyer) { create(:user, :lawyer) }
  let(:question) { create(:question, user: user) }
  let(:question1) { create(:question, user: user) }
  let!(:answer) { create(:answer, question: question1, user: lawyer, proposed_fee: 20, paid: false) }

  before do
    sign_in user, scope: :user  # Sign in as user for the test
  end

  scenario "User sees an answer from a lawyer after approving payment" do
    # As a lawyer, submit an answer
    sign_in lawyer, scope: :user  # Sign in as the lawyer
    visit new_lawyers_question_answer_path(question)

    fill_in 'Your Legal Advice', with: 'You should always have a written agreement.'
    fill_in 'Proposed Fee (£)', with: '20'
    click_button 'Submit Answer'

    # As a user, visit the question's page
    sign_in user, scope: :user  # Sign in again as user
    visit clients_question_path(question)

    # Ensure the payment button and answer are visible
    expect(page).to have_button('Approve Payment (£20.0)')
    expect(page).to have_text('This answer is locked until payment is approved.')

    # Approve the payment
    click_button 'Approve Payment (£20.0)'

    # The question stuatus updated with answered and user can view given answer
    expect(question.reload.status).to eq('answered')
    expect(page).to have_text('You should always have a written agreement.')
  end

  it 'marks answer as paid after user approves payment' do
    post approve_answer_payment_clients_question_path(question1, answer)

    answer.reload
    expect(answer.paid).to be true
    expect(question1.reload.status).to eq("answered")
  end
end
