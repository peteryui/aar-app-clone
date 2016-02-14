class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :subject
      t.text :should_happen
      t.text :actual_happen
      t.text :improvement_plan
      t.integer :user_id
      t.integer :event_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
