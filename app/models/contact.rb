class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :events, through: :invitees
end
