module TeamConcern
  extend ActiveSupport::Concern

  included do
    has_many :team_users
    has_many :teams, :through => :team_users
  end

  module ClassMethods

  end

  def current_team
    teams.where("role != ?", "leave").first
  end

  def belongs_to_team?(team)
    team_user = team_user(team)

    team_user.present? && !team_user.leave?
  end

  def team_user(team)
    team_users.find_by_team_id(team.id)
  end

  def team_role(team)
    team_user(team).role
  end

  def join_team(team)
    team_user = team_user(team)

    if team_user.present?
      if team_user.leave?
        team_user.join!
      else
        return false
      end
    else
      if current_team.present?
        if self.team_role(current_team) == "admin"
          return false
        else
          self.leave_team(current_team)
          team.users << self
        end
      else
          team.users << self
      end
    end

  end

  def leave_team(team)
    return false if !self.belongs_to_team?(team)

    team_user(team).leave!
  end

end
