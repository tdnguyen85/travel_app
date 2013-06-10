class CreateCompanionships < ActiveRecord::Migration
  def change
    create_table :companionships do |t|
      t.integer :user_id
      t.integer :companion_id

      t.timestamps
    end
  end
end
