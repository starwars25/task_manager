class TasksController < ApplicationController

  http_basic_authenticate_with name: ENV["TASK_MANAGER_LOGIN"], password: ENV["TASK_MANAGER_PASSWORD"]

  def create
    @project = Project.includes(:tasks).find(params[:project_id])
    @task = Task.new(status: :active, project_id: params[:project_id])
    @task.attributes = task_params
    if @task.save
      flash[:success] = 'Task successfully created.'
      redirect_to @project
    else
      render 'projects/show'
    end
  end

  def complete
    @task = Task.find(params[:task_id])
    @task.update_attribute(:status, params[:status])
    respond_to do |format|
      format.html do
        flash[:success] = 'Task completed.'
        redirect_to @task.project
      end
      format.js do
        params[:status] == 'completed' ? render(:task_completed) : render(:task_active)
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end

end
