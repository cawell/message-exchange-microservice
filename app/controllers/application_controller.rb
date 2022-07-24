# frozen_string_literal: true

class ApplicationController < ActionController::API
  # before_action :authorize_user!

  # attr_reader :current_user

  def current_ability
    @current_ability ||= Ability.new(current_user, params)
  end

  def authorize_user!
    user_id = Authorization.call(request.headers)[:user_id]
    @current_user = User.find(user_id)
  end
end
