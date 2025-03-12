class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward_tier
end
