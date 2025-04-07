# frozen_string_literal: true

module Admin
  # Admin dashboard
  class DashboardController < BaseController
    def index
      @paid_answer = Answer.paid
      @paid_answers_count = @paid_answer.count
      @simulated_revenue = @paid_answer.sum(:proposed_fee)
      @open_que_count = Question.open.count
    end
  end
end
