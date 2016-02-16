require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: todos
#
#  id             :integer          not null, primary key
#  subject        :string
#  content        :text
#  user_id        :integer
#  event_id       :integer
#  team_id        :integer
#  review_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  status         :string
#  comments_count :integer          default(0)
#
# Indexes
#
#  index_todos_on_status  (status)
#
