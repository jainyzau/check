class CreateWorkRecords < ActiveRecord::Migration
  def change
    create_table :work_records do |t|
      t.integer :work_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
