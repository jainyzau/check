class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :work_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
