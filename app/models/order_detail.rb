class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: {makimg_out:0, making_wait:1, making:2, make_up:3}
  
end
