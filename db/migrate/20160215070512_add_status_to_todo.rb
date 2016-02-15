class AddStatusToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :status, :string
    add_index :todos, :status
  end
end
