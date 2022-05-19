# lib/json_web_token.rb

class JsonWebToken
  class << self
    def encode(payload, exp = 12.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, secret_key_base, 'RS512')
    end
 
    def decode(token)
      HashWithIndifferentAccess.new jwt_decode(token)
    rescue
      nil
    end

    private 

      def secret_key_base
        OpenSSL::PKey::RSA.new(Rails.application.credentials[:jwt_private])
      end

      def jwt_decode(token)
        JWT.decode(
          token, 
          secret_key_base.public_key,
          true,
          algorithm: 'RS512'
        )[0]
      end
  end
 end