class CreateJoinTableRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_foods do |t|
      t.decimal :quantity
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
