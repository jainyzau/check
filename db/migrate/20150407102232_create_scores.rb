class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :work_id
      t.integer :user_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
