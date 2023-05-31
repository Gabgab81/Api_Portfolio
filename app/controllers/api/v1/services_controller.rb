class Api::V1::ServicesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  # acts_as_token_authentication_handler_for User, except: [:index, :show ]

  def index
    @services = policy_scope(Service)
  end

end