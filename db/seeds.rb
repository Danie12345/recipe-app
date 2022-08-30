# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Mahmoud")
user2 = User.create(name: "Daniel")

# recipe1 = Recipe.create(name: "Star Wars", preparation_time: 2.hours, cooking_time: 1.hours, description: "The star wars recipe description", public: true, user_id: user1.id)
# recipe2 = Recipe.create(name: "Other Star Wars", preparation_time: 3.hours, cooking_time: 2.hours, description: "The other star wars recipe description", public: false, user_id: user2.id)

# food1 = Food.create(name: "Apple", measurement_unit: 'kg', price: 2.5, quantity: 4, user_id: user1.id)
# food2 = Food.create(name: "Pineapple", measurement_unit: 'kg', price: 2, quantity: 1, user_id: user2.id)
# food3 = Food.create(name: "Watermelon", measurement_unit: 'kg', price: 5, quantity: 1, user_id: user2.id)
# food4 = Food.create(name: "Banana", measurement_unit: 'kg', price: 1.1, quantity: 6, user_id: user2.id)

# RecipesFoods.create(quantity: 1, recipe_id: recipe1.id, food_id: food1.id)
# RecipesFoods.create(quantity: 2, recipe_id: recipe2.id, food_id: food2.id)
# RecipesFoods.create(quantity: 4, recipe_id: recipe2.id, food_id: food2.id)
# RecipesFoods.create(quantity: 1, recipe_id: recipe2.id, food_id: food2.id)
