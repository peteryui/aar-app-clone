class AddRoleToTeamUsers < ActiveRecord::Migration
  def change
    add_column :team_users, :role, :string, :default => "member"
  end
end
