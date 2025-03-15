class Api::V1::UserRewardsController < ApplicationController
  def show
    render json: @current_user.user_reward, include: :reward_tier
  end
end
