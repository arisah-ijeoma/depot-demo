class AddColumnsToOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :payment_type
    drop_table :payment_types
    add_column :orders, :pay_type, :string
    add_column :orders, :credit_card_number, :string
    add_column :orders, :expiration_date, :string
    add_column :orders, :routing_number, :string
    add_column :orders, :accounting_number, :string
    add_column :orders, :po_number, :string
  end
end
