class AddNewColumntoItenerary < ActiveRecord::Migration
  def up
    add_column :iteneraries, :trip_id, :integer
  end

  def down
    remove_column :iteneraries, :trip_id, :integer
  end
end
