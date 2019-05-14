class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :detail, :completed)
  end
end
