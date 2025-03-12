class CreateRewardTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :reward_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points
      t.string :transaction_type
      t.string :description

      t.timestamps
    end
  end
end
