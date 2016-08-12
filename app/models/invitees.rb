class Invitees < ActiveRecord::Base
  belongs_to :events
  belongs_to :contacts
end
