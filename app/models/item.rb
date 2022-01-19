class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_details, dependent: :destroy

  attachment :image

  def with_price
    (price*1.1).floor
  end

end
