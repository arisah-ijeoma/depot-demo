class LineItem < ApplicationRecord
  before_validation :add_price

  belongs_to :product, optional: true
  belongs_to :order, optional: true
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def add_price
    self.price = product.price
  end
end
