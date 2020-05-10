class TasksController < ApplicationController
  before_action :set_task, only: %i[show update cancel done]

  def show
    respond_to { |f| f.js }
  end

  def new
    @task = Task.new
    respond_to { |f| f.js }
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'Task was successfully created.'
    else
      redirect_to root_path, error: 'Task was not created.'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task was successfully updated.'
    else
      redirect_to root_path, error: 'Task was not updated.'
    end
  end

  def cancel
    respond_to { |f| f.js }
  end

  def done
    respond_to { |f| f.js }
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :status, :reason,:started_at,
                                 :finished_at, :user_id, :team_id)
  end
end
