class CreateIteneraries < ActiveRecord::Migration
  def change
    create_table :iteneraries do |t|
      t.string :item
      t.boolean :activity_to_do
      t.boolean :place_to_eat
      t.boolean :place_to_sleep

      t.timestamps
    end
  end
end
