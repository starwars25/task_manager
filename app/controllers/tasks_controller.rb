class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @active_tasks = @project.tasks.where(['status = ?', 0])
    @completed_tasks = @project.tasks.where(['status = ?', 1])
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
    byebug
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end

end
