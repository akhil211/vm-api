class Api::V1::BaseController < ApplicationController
  include Responder
  # Check for logged in user on every API call
  before_action :authenticate

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present? && token_valid?
      user = User.find_by(id: auth['user'])
      if user
        obj_class = user.role.titleize.constantize
        user = obj_class.find_by(id: auth['user'])
        @current_user ||= user
      end
    end
  end

  def authenticate
    render_unauthorized unless logged_in?
  end

  private

   def token
     request.env["HTTP_AUTHORIZATION"]
   end

   def auth
     @decoded_token["data"]
   end

   def auth_present?
     !!request.env.fetch("HTTP_AUTHORIZATION","")
   end

   def token_valid?
     @decoded_token = Auth.decode(token)
     @decoded_token.present?
   end

end
