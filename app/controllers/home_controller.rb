# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    
    render json: {
      rails_env: Rails.env,
      ruby_version: RUBY_VERSION,
      rails_version: Rails.version,
      development_by: 'Wellington Caetano (cawell)',
      jwt: JsonWebToken.encode(user_id: 1)
    }, status: :ok
  end
end
