class Order < ApplicationRecord
  belongs_to :user
  has_many :tracking_updates, dependent: :destroy

  validates :weight, :volume, :length, :width, :height, presence: true
  validates :status, presence: true

  # 发件人验证
  validates :sender_name, :sender_phone, :sender_country, :sender_province, :sender_city, :sender_district, :sender_detail_address, presence: true
  # 收件人验证
  validates :receiver_name, :receiver_phone, :receiver_country, :receiver_province, :receiver_city, :receiver_district, :receiver_detail_address, presence: true

  before_validation :set_default_status, on: :create

  def sender_full_address
    [sender_country, sender_province, sender_city, sender_district, sender_detail_address].compact.join(' ')
  end

  def receiver_full_address
    [receiver_country, receiver_province, receiver_city, receiver_district, receiver_detail_address].compact.join(' ')
  end

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
