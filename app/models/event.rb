class Event < ActiveRecord::Base
  belongs_to :host, { class_name: 'User' } 
  has_many :contacts, through: :invitees

  validates :title, :description, presence: true

  validates :description, length: { maximum: 2000,
    too_long: "%{count} characters is the maximum allowed" }


end
