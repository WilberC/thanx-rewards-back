class Api::V1::RewardTiersController < ApplicationController
  skip_before_action :authorize_request, only: [:index]

  def index
    reward_tiers = RewardTier.order(:points_required)
    render json: reward_tiers
  end
end
