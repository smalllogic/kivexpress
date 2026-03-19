class Address < ApplicationRecord
  belongs_to :user

  validates :country, :province, :city, :district, :detail_address, :contact_name, :phone, presence: true
end
