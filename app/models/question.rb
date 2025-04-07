# frozen_string_literal: true

# :nodoc:
class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true

  enum :status, { open: 0, answered: 1, closed: 2 }
  scope :open, -> { where(status: 'open') }

  before_validation :set_default_status, on: :create

  private

  def set_default_status
    self.status ||= :open
  end
end
