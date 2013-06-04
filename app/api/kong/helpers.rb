module Kong
  module APIHelpers
    def current_user
      token = params[:token]
      @current_user ||= User.where(:remember_token => token).first
    end
    
    # def oauth_token
    #   token = env['HTTP_AUTHORIZATION'] || ""
    #   token.split(" ").last
    # end

    def authenticate!
      error!({ "error" => "401 Unauthorized" }, 401) unless current_user
    end
  end
end