class AddMoodIdToVents < ActiveRecord::Migration
  def change
    add_column :vents, :mood_id, :integer
    add_index :vents, :mood_id
  end
end
