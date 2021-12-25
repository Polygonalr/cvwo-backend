class ApplicationController < ActionController::Base
    before_action :require_jwt
    skip_before_action :verify_authenticity_token

    def require_jwt
        token = request.headers["HTTP_AUTHORIZATION"]
        if !token
            render json: { message: "No JWT provided" }, status: :forbidden
        end
        if !valid_token(token)
            render json: { message: "Invalid JWT" }, status: :forbidden
        end
    end

    def secret
        secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
    end

    def token
        auth_header.split(" ")[1]
    end

    def create_token(payload)
        JWT.encode(payload, secret)
    end

    private
    def valid_token(token)
        unless token
            return false
        end

        token.gsub!('Bearer ', '')
        begin
            decoded_token = JWT.decode token, secret, true
            return true
        rescue JWT::DecodeError
            Rails.logger.warn "Error decoding JWT: " + e.to_s
        end
        false
    end
end
