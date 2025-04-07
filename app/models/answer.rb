# frozen_string_literal: true

# :nodoc:
class Answer < ApplicationRecord
  include Loggable
  belongs_to :question
  belongs_to :user

  validates :response_text, presence: true
  validates :proposed_fee, presence: true

  scope :paid, -> { where(paid: true) }

  after_create :generate_payment_request

  def generate_payment_request
    log_info("Simulated payment request sent to #{question.user.name} for £#{proposed_fee}")
    log_info("Simulated email: 'Hi #{question.user.name}, a lawyer-#{user.name} " \
    "has answered your question. Approve payment to see it!'")
  end

  def approved_payment
    update(paid: true)
    question.update(status: 'answered') if question.status == 'open'

    log_info("User #{question.user.name} approved payment of £#{proposed_fee} for answer ##{id}")
  end
end
