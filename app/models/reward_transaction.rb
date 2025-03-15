class RewardTransaction < ApplicationRecord
  belongs_to :user

  TRANSACTION_TYPES = %w[earn redeem].freeze

  validates :points, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
  validates :description, presence: true
end
