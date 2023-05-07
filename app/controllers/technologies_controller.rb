class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]

  def index
    # @technologies = Technology.all
    @technologies = policy_scope(Technology)
  end

  def show
    # @technology = Technology.find(params[:id])
    authorize @technology
  end

  def new
    @technology = Technology.new
    authorize @technology
  end

  def create
    @technology = Technology.new(technology_params)
    @technology.user = current_user
    authorize @technology
    if @technology.save
      redirect_to technology_path(@technology)
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
    # @technology = Technology.find(params[:id])
    authorize @technology
  end

  def update
    # @technology = Technology.find(params[:id])
    authorize @technology
    if @technology.update(technology_params)
      redirect_to technology_path(@technology)
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    # raise
    # @technology = Technology.find(params[:id])
    authorize @technology
    @technology.destroy
    # raise
    redirect_to technologies_path, status: :see_other
  end

  private

  def technology_params
    params.require(:technology).permit(:name, :icon)
  end

  def set_technology
    @technology = Technology.find(params[:id])
  end
end
