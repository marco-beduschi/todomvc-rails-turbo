# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = params['completed'] ? Task.completed(params['completed']) : Task.all
    @task = Task.new
    @tasks_to_be_completed_count = Task.completed(false).count
  end

  def new; end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.turbo_stream { @new_task = Task.new }
        format.html { redirect_to tasks_url, notice: 'Task was successfully created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.turbo_stream { @tasks_to_be_completed_count = Task.completed(false).count }
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    @tasks_to_be_completed_count = Task.completed(false).count
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
