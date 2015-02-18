class AddNameToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :name, :text
  end
end
