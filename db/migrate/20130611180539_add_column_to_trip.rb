class AddColumnToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :open, :boolean
  end
end
