class TasksController < ApplicationController
  before_action :set_task, only: %i[show update cancel done]

  def show
    respond_to do |f|
      f.js
    end
  end

  def new
    @task = Task.new
    respond_to do |f|
      f.js
    end
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to dashboard_index_path, notice: 'Task was successfully created.' }
      else
        format.html { redirect_to dashboard_index_path, notice: 'Task was not created.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to dashboard_index_path, notice: 'Task was successfully updated.' }
      else
        format.html { redirect_to dashboard_index_path, notice: 'Task was not updated.' }
      end
    end
  end

  def cancel
    respond_to do |f|
      f.js
    end
  end

  def done
    respond_to do |f|
      f.js
    end
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
