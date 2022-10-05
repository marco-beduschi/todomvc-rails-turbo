# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'csv'

CSV.read('db/data/tasks.csv').each do |row|
  Task.create!(completed: row[0], description: row[1])
end
