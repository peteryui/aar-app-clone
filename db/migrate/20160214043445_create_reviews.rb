class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :subject
      t.string :should_happen
      t.string :actual_happen
      t.string :improvement_plan
      t.integer :user_id
      t.integer :event_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
