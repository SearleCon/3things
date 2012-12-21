class CreateStatusHistories < ActiveRecord::Migration
  def change
    create_table :status_histories do |t|
      t.integer :status_id
      t.integer :task_id

      t.timestamps
    end
  end
end
