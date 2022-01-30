class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_details, dependent: :destroy

  attachment :image
  
  validates :name, presence: true
  validates :price, presence: true

  def with_tax_price
    (price*1.1).floor
  end

end
