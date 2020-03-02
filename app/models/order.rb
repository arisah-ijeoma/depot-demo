class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :payment_type

  validates :name, :address, :email, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end
end
