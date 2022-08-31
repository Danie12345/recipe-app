class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipes_foods
  has_many :recipes, through: :recipes_foods

  validates :name, length: { maximum: 32 }, allow_blank: false
  validates :measurement_unit, length: { maximum: 8 }, allow_blank: false
  validates :price, numericality: true, allow_blank: false
  validates :quantity, numericality: true, allow_blank: false
  validates :user_id, uniqueness: { scope: :user_id }

  def allrecipesfoods
    recipes_foods.order(created_at: :desc)
  end
end
