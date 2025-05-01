# frozen_string_literal: true

module Lawyers
  # Lawyers Questions
  class QuestionsController < BaseController
    def index
      @pagy, @questions = pagy(Question.open.order(created_at: :desc))
    end

    def answered
      @pagy, @questions = pagy(AnsweredQuestionsService.new(current_user).call)
    end
  end
end
