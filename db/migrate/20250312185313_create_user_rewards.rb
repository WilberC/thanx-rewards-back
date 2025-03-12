class CreateUserRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :user_rewards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reward_tier, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
