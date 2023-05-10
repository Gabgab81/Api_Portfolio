class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @experience
  end

  def index
    @experiences = policy_scope(Experience)
  end

  def show
    # @experience = Experience.find(params[:id])
    authorize @experience
  end

  def edit
    # @experience = Experience.find(params[:id])
    authorize @experience
  end

  def update
    # @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      redirect_to experience_path(@experience)
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @experience
  end

  def destroy
    # @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to experiences_path
    authorize @experience
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :compagny_name, :description, :date, :logo)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

end
