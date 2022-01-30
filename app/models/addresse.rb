class Addresse < ApplicationRecord

  belongs_to :customer
  
  validates :name, presence: true
  validates_associated :postal_code
  validates_associated :address
  
  def full_address
    "〒" + postal_code + " " + address + " " + name
  end
end
