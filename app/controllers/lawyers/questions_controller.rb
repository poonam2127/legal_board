# frozen_string_literal: true

module Lawyers
  # Lawyers Questions
  class QuestionsController < BaseController
    def index
      @questions = Question.open
    end

    def answered
      @questions = current_user.answered_questions
    end
  end
end
