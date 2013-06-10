class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.integer :user_id
      t.integer :like
      t.date :begin_on
      t.date :end_on

      t.timestamps
    end
  end
end
