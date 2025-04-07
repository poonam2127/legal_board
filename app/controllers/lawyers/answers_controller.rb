# frozen_string_literal: true

module Lawyers
  # Lawyers Answers
  class AnswersController < BaseController
    before_action :set_question, only: %i[new create view]
    before_action :verify_question_status, only: %i[create]

    def new
      @answer = current_user.answers.build
    end

    def create
      @answer = current_user.answers.build(answer_params)
      @answer.question = @question

      if @answer.save
        flash[:success] = "Simulated payment request sent."
        redirect_to lawyers_questions_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def view
      @answers = current_user.answers.where(question_id: @question.id)
    end

    private

    def set_question
      @question = Question.find(params[:question_id])
    end

    def verify_question_status
      redirect_to lawyers_questions_path unless @question.open?
    end

    def answer_params
      params.require(:answer).permit(:response_text, :proposed_fee)
    end
  end
end
