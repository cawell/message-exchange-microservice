# frozen_string_literal: true

class Session
  class << self
    def call(email, password)
      user = User.find_by_email(email)

      raise 'Usuario nao encontrado' if user.blank?
      raise 'Usuario nao é valido' unless user.authenticate(password)

      create_token(user)
    end

    def create_token(user)
      JsonWebToken.encode(
        user_id: user.id
      )
    end
  end
end
