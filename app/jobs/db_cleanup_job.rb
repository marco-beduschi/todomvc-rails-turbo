# frozen_string_literal: true

require 'csv'

class DbCleanupJob < ApplicationJob
  queue_as :cleanup

  def perform(*_args)
    Task.all.map(&:destroy!)

    CSV.read('db/data/tasks.csv').each do |row|
      Task.create!(completed: row[0], description: row[1])
    end
  end
end
