class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :favorite_type

      t.timestamps
    end
  end
end
