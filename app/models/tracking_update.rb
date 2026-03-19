class TrackingUpdate < ApplicationRecord
  belongs_to :order
  validates :status_description, presence: true
end
