class TechnologiesController < ApplicationController

  def index
    @technologies = Technology.all
  end

  def show
    @technology = Technology.find(params[:id])
  end

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)
    @technology.user = current_user
    if @technology.save
      redirect_to technology_path(@technology)
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:id])
    if @technology.update(technology_params)
      redirect_to technology_path(@technology)
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    # raise
    @technology = Technology.find(params[:id])
    @technology.destroy
    # raise
    redirect_to technologies_path, status: :see_other
  end

  private

  def technology_params
    params.require(:technology).permit(:name)
  end
end
