class CreateUserWeights < ActiveRecord::Migration
  def change
    create_table :user_weights do |t|
      t.references :user, index: true
      t.references :weight, index: true

      t.timestamps
    end
  end
end
