class AddColumnToItenerary < ActiveRecord::Migration
  def change
    add_column :iteneraries, :city_id, :integer
    add_column :iteneraries, :act_on, :date
  end
end
