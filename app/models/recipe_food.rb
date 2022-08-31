class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id'
  belongs_to :food, class_name: 'Food', foreign_key: 'food_id'

  def allfoods(_recipe_id)
    RecipeFood.where(:recipe_id)
  end

  def allrecipes(_food_id)
    RecipeFood.where(:food_id)
  end
end
