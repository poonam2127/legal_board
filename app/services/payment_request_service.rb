# frozen_string_literal: true

# :nodoc:
class PaymentRequestService
  include Loggable
  def initialize(answer)
    @answer = answer
    @question = answer.question
  end

  def call
    log_payment_request
    simulate_email
  end

  private

  def log_payment_request
    log_info("Simulated payment request sent to #{@question.user.name} " \
              "for £#{@answer.proposed_fee}")
  end

  def simulate_email
    log_info("Simulated email: 'Hi #{@question.user.name}, a lawyer-#{@answer.user.name} " \
             "has answered your question. Approve payment to see it!'")
  end
end
