# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created' }
      else
        format.html { redirect_to tasks_url, status: :unprocessable_entity }
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
        format.json { render json: { message: 'Success' } }
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated' }
      else
        format.json { render json: { message: 'error' } }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])

    return unless @task.destroy

    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
