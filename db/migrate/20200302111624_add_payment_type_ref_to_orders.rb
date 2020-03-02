class AddPaymentTypeRefToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :payment_type, null: true, foreign_key: true
  end
end
