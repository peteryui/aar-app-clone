class Team < ActiveRecord::Base

  has_many :team_users
  has_many :users, :through => :team_users, :source => :user

  has_many :events
  has_many :reviews
  has_many :invitations
  has_many :comments

  validates :name, presence: true
  validates :domain, presence: true


  def grant_first_user_as_admin
    reload
    first_user = users.first
    grant_admin!(first_user)

  end

  def grant_admin!(user)
    team_user(user).grant_admin!
  end

  def remove_admin!(user)
    team_user(user).remove_admin!
  end

  def team_user(user)
    team_users.find_by_user_id(user.id)
  end



end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
