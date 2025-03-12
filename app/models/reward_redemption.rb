class RewardRedemption < ApplicationRecord
  belongs_to :user
  belongs_to :reward_catalog
end
