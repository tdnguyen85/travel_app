class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mood
      t.string :home_base
      t.string :current_location
      t.string :bio
      t.string :goal

      t.timestamps
    end
  end
end
