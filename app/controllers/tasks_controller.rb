class TasksController < ApplicationController
  def index
    @task = Task.new
    @space = Space.find(params[:space_id])
    @tasks = @space.tasks.includes(:user)
  end

  def create
    @space = Space.find(params[:space_id])
    @task = @space.tasks.new(task_params)
    if @task.save
      redirect_to space_tasks_path(@space)
    else
      @tasks = @space.tasks.includes(:user)
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :deadline, :status).merge(user_id: current_user.id)
  end
end
