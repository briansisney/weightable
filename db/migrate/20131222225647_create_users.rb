class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pic
      t.integer :goal
      t.string :height_feet
      t.string :height_in
      
      t.timestamps
    end
  end
end
