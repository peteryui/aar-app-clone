class Event < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  has_many :reviews
  has_many :todos

  validates :name, presence: true

  scope :recent , -> { order("id DESC")}
end

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  todos_count :integer          default(0)
#
