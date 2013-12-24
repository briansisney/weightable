class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.string :date
      t.integer :weight
      t.string :pic
      t.references :user, index: true

      t.timestamps
    end
  end
end
