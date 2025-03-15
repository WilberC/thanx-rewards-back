class RewardRedemption < ApplicationRecord
  belongs_to :user
  belongs_to :reward_catalog

  STATUS_TYPES = %w[pending approved declined].freeze

  validates :points_spent, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: STATUS_TYPES }
end
