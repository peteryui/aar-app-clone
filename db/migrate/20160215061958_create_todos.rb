class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :subject
      t.text   :content
      t.integer :user_id
      t.integer :event_id
      t.integer :team_id
      t.integer :review_id
      t.timestamps null: false
    end
  end
end
