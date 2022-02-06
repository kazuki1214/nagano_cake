class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_for_deposit: 0, payment_confirmation: 1, making: 2,ready_to_ship: 3, sent: 4 }

  validates :name, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9]{7}\z/ }
  validates :address, presence: true

end
