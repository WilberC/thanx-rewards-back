class CreateRewardRedemptions < ActiveRecord::Migration[8.0]
  def change
    create_table :reward_redemptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reward_catalog, null: false, foreign_key: true
      t.integer :points_spent
      t.string :status

      t.timestamps
    end
  end
end
