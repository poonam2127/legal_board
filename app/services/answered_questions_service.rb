# frozen_string_literal: true

# :nodoc:
class AnsweredQuestionsService
  def initialize(user)
    @user = user
  end

  def call
    question_ids = @user.answers.includes(:question)
                        .where(questions: { status: 'answered' })
                        .distinct
                        .pluck(:question_id)
    Question.where(id: question_ids)
            .order('created_at DESC')
  end
end
