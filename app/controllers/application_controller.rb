class ApplicationController < ActionController::Base
    before_action :require_jwt
    skip_before_action :verify_authenticity_token

    def require_jwt
        auth_header = request.headers["HTTP_AUTHORIZATION"]
        if !auth_header
            render json: { message: "No JWT provided" }, status: :forbidden
            return false
        end
        if !valid_token(auth_header)
            render json: { message: "Invalid JWT" }, status: :forbidden
            return false
        end
        return true
    end

    def secret
        secret =  ENV['SECRET_KEY_BASE'] || Rails.application.secret_key_base
    end

    def create_token(payload)
        JWT.encode payload, secret, 'HS256'
    end

    private
    def valid_token(token)
        unless token
            return false
        end

        token.gsub!('Bearer ', '')
        begin
            @decoded_token = JWT.decode token, secret, true, { algorithm: 'HS256' }
            user_id = @decoded_token[0]["user_id"]
            if user_id
                @user = User.find_by(id: @decoded_token[0]["user_id"])
                if @user
                    return true
                end
            end
            return false
        rescue JWT::DecodeError => e
            Rails.logger.warn "Error decoding JWT: " + e.to_s
        end
        false
    end
end
