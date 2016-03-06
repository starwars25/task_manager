class ProjectsController < ApplicationController

  http_basic_authenticate_with name: ENV["TASK_MANAGER_LOGIN"], password: ENV["TASK_MANAGER_PASSWORD"]

  def index
    @projects = Project.all
    @project = Project.new
  end

  def show
    @project = Project.includes(:tasks).find(params[:id])
    @task = Task.new(project_id: @project.id)
  end

  def create
    @projects = Project.includes(:tasks).all
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Project successfully created.'
      redirect_to root_url
    else
      render :index
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

end
