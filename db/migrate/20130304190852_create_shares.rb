class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.belongs_to :vent
      t.belongs_to :user
      t.string :network
      t.string :with

      t.timestamps
    end
    add_index :shares, :vent_id
    add_index :shares, :user_id
  end
end
