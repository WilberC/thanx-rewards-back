class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  skip_before_action :authorize_request, only: [:create]

  # GET /api/v1/users
  def index
    users = User.all
    render json: users
  end

  # GET /api/v1/users/:id
  def show
    render json: @user
  end

  # POST /api/v1/users
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({ user_id: user.id })
      render json: {
        user: {
          id: user.id,
          email: user.email,
          name: user.name
        },
        token: token
      }, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end
end
