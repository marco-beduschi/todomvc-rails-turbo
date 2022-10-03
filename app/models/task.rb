# frozen_string_literal: true

class Task < ApplicationRecord
  validates :description, presence: true

  scope :to_be_completed, -> { where(completed: false).or(where(completed: nil)) }
end
