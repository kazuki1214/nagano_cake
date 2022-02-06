class Address < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true
   validates :postal_code, presence: true, format: { with: /\A[0-9]{7}\z/ }
   validates :address, presence: true

  def full_address
    "〒" + postal_code + " " + address + " " + name
  end
end
