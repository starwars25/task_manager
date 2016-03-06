class TasksController < ApplicationController

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

  private

  def task_params
    params.require(:task).permit(:content)
  end

end
