class Authorization
  class << self

    def call(headers = {})
      @token = headers['Authorization'].split(' ').last
      JsonWebToken.decode(@token)
    end
  end
end