# frozen_string_literal: true

module Clients
  # Client Questions
  class QuestionsController < BaseController
    before_action :set_question, only: %i[show approve_answer_payment]

    def index
      @questions = current_user.questions.order(created_at: :desc)
    end

    def new
      @question = current_user.questions.build
    end

    def create
      @question = current_user.questions.build(question_params)

      if @question.save
        flash[:success] = 'Question Created Succssfully.'
        redirect_to clients_questions_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @answers = @question.answers
    end

    def approve_answer_payment
      @answer = @question.answers.find(params[:answer_id])
      @answer.approved_payment

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("status_answers_#{@question.id}", 'Answered'),
            turbo_stream.replace(
              "answer_#{@answer.id}",
              partial: 'single_answer',
              locals: { answer: @answer, question: @question }
            )
          ]
        end
        format.html do
          redirect_to clients_question_path(@question),
                      notice: 'Payment approved. You can now view the answer.'
        end
      end
    end

    private

    def question_params
      params.require(:question).permit(:title, :body, :category)
    end

    def set_question
      if current_user.questions.present?
        @question = current_user.questions.find_by_id(params[:id])
        redirect_to root_path unless @question
      else
        redirect_to root_path
      end
    end
  end
end
