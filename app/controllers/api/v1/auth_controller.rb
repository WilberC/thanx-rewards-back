class Api::V1::AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:login]

  SECRET_KEY = Rails.application.credentials.secret_key_base

  # POST /api/v1/login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end
end
