class Invitation < ActiveRecord::Base
  include AASM

  belongs_to :team
  belongs_to :inviter, :foreign_key => :inviter_id, :class_name => "User"
  belongs_to :invitee, :foreign_key => :invitee_id, :class_name => "User"

  before_create :generate_code

  scope :recent, -> { order("id DESC") }

  validates :email_address,  :presence => true
  validates_format_of :email_address, :with => /@/

  aasm :column => :status do
    state :sent, :initial => true
    state :cancel
    state :deny
    state :complete

    event :cancel do
      transitions :to => :cancel, :from => [:sent]
    end

    event :deny do
      transitions :to => :deny, :from => [:sent]
    end

    event :complete do
      transitions :to => :complete, :from => [:sent]
    end

  end


  def available_for_guest?
    self.sent? && invitee_id.blank?
  end


  private

  def generate_code
    self.code = SecureRandom.hex
  end


end


# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  code          :string
#  email_address :string
#  team_id       :integer
#  inviter_id    :integer
#  invitee_id    :integer
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
