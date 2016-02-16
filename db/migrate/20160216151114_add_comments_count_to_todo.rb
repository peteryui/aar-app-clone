class AddCommentsCountToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :comments_count, :integer, :default => 0
  end
end
