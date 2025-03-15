class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward_tier

  validates :points, numericality: { greater_than_or_equal_to: 0 }
end
