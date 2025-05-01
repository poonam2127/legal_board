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

  def approved_payment
    update(paid: true)
    question.update(status: 'answered') if question.status == 'open'

    log_info("User #{question.user.name} approved payment of £#{proposed_fee} for answer ##{id}")
  end

  private

  def generate_payment_request
    PaymentRequestService.new(self).call
  end
end
