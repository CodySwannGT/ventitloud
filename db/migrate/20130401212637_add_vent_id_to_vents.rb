class AddVentIdToVents < ActiveRecord::Migration
  def change
    add_column :vents, :vent_id, :integer
    add_index :vents, :vent_id
  end
end
