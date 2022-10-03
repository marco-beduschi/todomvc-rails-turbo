# frozen_string_literal: true

class UpdateTasksCompletedDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tasks, :completed, false, false
    change_column_default :tasks, :completed, from: nil, to: false
  end
end
