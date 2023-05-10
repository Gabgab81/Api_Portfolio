class TechProjectsController < ApplicationController

  def new
    # raise
    @tech_project = TechProject.new
    @project = Project.find(params[:project_id])
    technolgies_project = @project.techProjects.map {|tp| tp.technology }
    @technologies = Technology
      .where(user: current_user)
      .excluding(technolgies_project)
    authorize @tech_project
  end
  
  def create
    @tech_project = TechProject.new
    @project = Project.find(params[:project_id])
    @tech_project.project = @project
    @tech_project.technology = Technology.find(tech_project_params)
    authorize @tech_project
    if @tech_project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tech_project = TechProject.find(params[:id])
    @project = Project.find(params[:project_id])
    authorize @tech_project
    @tech_project.destroy
    redirect_to project_path(@project), status: :see_other
  end

  private

  def tech_project_params
    params.require(:tech_project).require(:technology_id)
  end
end
