class CreateRewardCatalogs < ActiveRecord::Migration[8.0]
  def change
    create_table :reward_catalogs do |t|
      t.string :name
      t.text :description
      t.integer :points_cost

      t.timestamps
    end
  end
end
