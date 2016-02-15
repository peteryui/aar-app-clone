class AddCounterCacheToTodo < ActiveRecord::Migration
  def change
    add_column :reviews, :todos_count, :integer, :default => 0
    add_column :events, :todos_count, :integer, :default => 0
    add_column :teams, :todos_count, :integer, :default => 0
  end
end
