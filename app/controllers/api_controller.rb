class ApiController < ApplicationController

    skip_before_action :verify_authenticity_token

    private
    def authenticated?
        authenticate_or_request_with_http_basic {|username, password_digest| User.where( username: username, password_digest: password_digest).present? }
    end
end
