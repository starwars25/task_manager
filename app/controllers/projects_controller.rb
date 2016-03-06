class ProjectsController < ApplicationController

  def index
    @projects = Project.includes(:tasks).all
    @project = Project.new
  end

  def show
    @project = Project.includes(:tasks).find(params[:id])
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
