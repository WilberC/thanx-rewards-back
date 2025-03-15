class Api::V1::RewardRedemptionsController < ApplicationController
  def create
    reward = RewardCatalog.find(params[:reward_catalog_id])

    if @current_user.user_reward.points < reward.points_cost
      return render json: { error: "Not enough points" }, status: :unprocessable_entity
    end

    redemption = @current_user.reward_redemptions.create!(
      reward_catalog: reward,
      points_spent: reward.points_cost,
      status: "pending"
    )

    @current_user.user_reward.update!(points: @current_user.user_reward.points - reward.points_cost)

    render json: redemption, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    reward_redemptions = @current_user.reward_redemptions.includes(:reward_catalog)

    render json: reward_redemptions.map { |redemption|
      {
        id: redemption.id,
        created_at: redemption.created_at,
        reward_catalog_name: redemption.reward_catalog.name,
        points_spent: redemption.points_spent,
      }
    }
  end
end
