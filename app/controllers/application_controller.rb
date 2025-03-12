class ApplicationController < ActionController::API
  before_action :authorize_request

  SECRET_KEY = Rails.application.credentials.secret_key_base

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    begin
      decoded = JWT.decode(token, SECRET_KEY)[0]
      @current_user = User.find(decoded["user_id"])
    rescue
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
