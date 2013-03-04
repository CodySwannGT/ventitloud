class CreateVents < ActiveRecord::Migration
  def change
    create_table :vents do |t|
      t.belongs_to :user
      t.text :text
      t.boolean :public, null: false, default: false

      t.timestamps
    end
    add_index :vents, :user_id
  end
end
