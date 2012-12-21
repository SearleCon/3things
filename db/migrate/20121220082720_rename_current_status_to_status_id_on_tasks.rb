class RenameCurrentStatusToStatusIdOnTasks < ActiveRecord::Migration
  def up
    rename_column :tasks, :current_status, :status_id
  end

  def down
    rename_column :tasks, :status_id, :current_status
  end
end
