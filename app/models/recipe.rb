class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :foods, foreign_key: 'recipe_id', dependent: :delete_all
end
