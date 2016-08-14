class Invitee < ActiveRecord::Base
  belongs_to :event
  belongs_to :contact

  validates :contact_id, :event_id, :attending?, presence: true
end
