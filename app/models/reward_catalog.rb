class RewardCatalog < ApplicationRecord
  has_many :reward_redemptions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :points_cost, presence: true, numericality: { greater_than: 0 }
end
