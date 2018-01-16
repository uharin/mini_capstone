class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :user, optional: true


  def uncart
    status = "uncart"
  end

end
