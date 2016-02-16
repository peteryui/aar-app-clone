class Todo < ActiveRecord::Base

  belongs_to :user
  belongs_to :team, :counter_cache => true
  belongs_to :event, :counter_cache => true
  belongs_to :review, :counter_cache => true

  validates :subject, presence: true

  include AASM

  aasm :column => :status do
    state :open, :initial => true
    state :pending
    state :closed

    event :pend do
      transitions :to => :pending, :from => [:open]
    end

    event :close do
      transitions :to => :closed, :from => [:open, :pending]
    end

    event :open do
      transitions :to => :open, :from => [:closed, :pending]
    end
  end

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
#  status     :string
#
# Indexes
#
#  index_todos_on_status  (status)
#
