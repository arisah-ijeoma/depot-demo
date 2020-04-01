class ChangeOrderPayTypeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :pay_type, :integer
  end
end
