class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: :password_required?

  has_one :user_reward, dependent: :destroy
  has_many :reward_transactions, dependent: :destroy
  has_many :reward_redemptions, dependent: :destroy

  after_create :initialize_rewards

  private

  def password_required?
    new_record? || password.present?
  end

  def initialize_rewards
    default_tier = RewardTier.order(:points_required).first
    create_user_reward(reward_tier: default_tier, points: 0) if default_tier
  end
end
