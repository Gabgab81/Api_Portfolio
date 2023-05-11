class Api::V1::TechnologiesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  # acts_as_token_authentication_handler_for User, except: [:index, :show ]

  def index
    @technologies = policy_scope(Technology)
  end

end