class Todo < ActiveRecord::Base

  belongs_to :user
  belongs_to :team
  belongs_to :event
  belongs_to :review

  validates :subject, presence: true
end

# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  subject    :string
#  content    :text
#  user_id    :integer
#  event_id   :integer
#  team_id    :integer
#  review_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
