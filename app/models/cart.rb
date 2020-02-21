class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product: product)

    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product: product)
    end

    current_item
  end

  def remove_one_item(line_item)
    if line_item.quantity > 1
      line_item.quantity -= 1
      line_item.save
    else
      line_item.destroy
    end
  end

  def total_price
    line_items.sum(&:total_price)
  end
end
