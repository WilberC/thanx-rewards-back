class RewardTier < ApplicationRecord
  has_many :user_rewards, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :points_required, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
