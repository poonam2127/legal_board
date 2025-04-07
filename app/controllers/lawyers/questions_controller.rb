# frozen_string_literal: true

module Lawyers
  # Lawyers Questions
  class QuestionsController < BaseController
    def index
      @questions = Question.open.order(created_at: :desc)
    end

    def answered
      @questions = current_user.answered_questions
    end
  end
end
