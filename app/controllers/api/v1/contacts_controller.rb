class Api::V1::ContactsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  # acts_as_token_authentication_handler_for User, except: [:index, :show ]
  before_action :set_contact, only: [:show]

  def show
    
  end
  
  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    authorize @contact
    if @contact.save
      render :show, status: :created
    else 
      render_error
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def set_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  def render_error
    render json: { errors: @contact.errors.full_messages },
      status: :unprocessable_entity
  end
end