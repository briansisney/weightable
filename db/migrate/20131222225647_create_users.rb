class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pic
      t.integer :goal
      t.references :weight, index: true

      t.timestamps
    end
  end
end
