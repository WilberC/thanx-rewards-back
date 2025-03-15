# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

RewardTier.create(
  [
    { name: "Bronze", points_required: 0 },
    { name: "Silver", points_required: 500 },
    { name: "Gold", points_required: 1000 }
  ]
)

RewardCatalog.create(
  [
    { name: "Discount", description: "10% off your next purchase ($5 max discount)", points_cost: 100 },
    { name: "Free Coffee", description: "Redeem a free coffee", points_cost: 300 },
    { name: "Free Espresso Shot", description: "Redeem a free coffee", points_cost: 400 },
    { name: "Free Bakery Item", description: "Redeem a free coffee", points_cost: 500 },
    { name: "Free Handcrafted Drink", description: "Redeem a free coffee", points_cost: 600 },
    { name: "Lunch Sandwich", description: "Redeem a free coffee", points_cost: 700 },
  ]
)

puts "Seeded Reward Tiers and Reward Catalog!"
