class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to contacts_path(@contact)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @contact
  end

  def index
    @contacts = policy_scope(Contact)
  end

  # def show
  #   authorize @contact
  # end

  # def edit
  #   # @contact = contact.find(params[:id])
  #   authorize @contact
  # end

  # def update
  #   # @contact = contact.find(params[:id])
  #   if @contact.update(contact_params)
  #     redirect_to contact_path(@contact)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  #   authorize @contact
  # end

  def destroy
    # @contact = contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
    authorize @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
