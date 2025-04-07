# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers

  enum :role, { admin: 0, lawyer: 1, client: 2 }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :client
  end

  def answered_questions
    answers.includes(:question).where(questions: { status: 'answered' }).map(&:question).uniq
  end
end
