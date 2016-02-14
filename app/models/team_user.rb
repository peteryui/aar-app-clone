class TeamUser < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  include AASM

  aasm :column => :role do
    state :member, :initial => true
    state :leave
    state :admin

    event :remove_admin do
      transitions :to => :member, :from => [:admin]
    end

    event :leave do
      transitions :to => :leave, :from => [:member, :admin]
    end

    event :join do
      transitions :to => :member, :from => [:leave]
    end

    event :grant_admin do
      transitions :to => :admin, :from => [:member]
    end
  end


end

# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :string           default("member")
#
