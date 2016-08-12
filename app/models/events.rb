class Events < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, through: :invitees

  validates :title, :description, :url, presence: true

  validates :description, length: { maximum: 2000,
    too_long: "%{count} characters is the maximum allowed" }


end
