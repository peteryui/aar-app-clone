class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string  :code
      t.string  :email_address
      t.integer :team_id
      t.integer :inviter_id
      t.integer :invitee_id
      t.string  :status
      t.timestamps null: false
    end
  end
end
