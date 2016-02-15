class AddTeamIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :team_id, :integer
  end
end
