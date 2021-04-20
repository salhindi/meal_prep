class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.text :name
      t.string :ingredients
      t.text :meal_time
      t.string :photo
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
