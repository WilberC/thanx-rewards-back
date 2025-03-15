class Api::V1::RewardTransactionsController < ApplicationController
  def create
    transaction = @current_user.reward_transactions.new(transaction_params)

    if transaction.transaction_type == "redeem" && transaction.points > @current_user.user_reward.points
      return render json: { error: "Not enough points" }, status: :unprocessable_entity
    end

    transaction.save!

    new_points = transaction.transaction_type == "earn" ?
                   @current_user.user_reward.points + transaction.points :
                   @current_user.user_reward.points - transaction.points

    @current_user.user_reward.update!(points: new_points)

    render json: transaction, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def transaction_params
    params.require(:reward_transaction).permit(:points, :transaction_type, :description)
  end
end
