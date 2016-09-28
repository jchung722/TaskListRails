class RemoveCompletionFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :completion, :boolean
  end
end
