class Event < ActiveRecord::Base
  belongs_to :team
  belongs_to :user

  validates :name, presence: true

  scope :recent , -> { order("id DESC")}
end

# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
