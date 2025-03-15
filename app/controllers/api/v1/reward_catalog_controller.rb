class Api::V1::RewardCatalogController < ApplicationController
  skip_before_action :authorize_request, only: [:index]

  def index
    rewards = RewardCatalog.all
    render json: rewards
  end
end
