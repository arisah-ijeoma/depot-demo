class RemovePayTypeFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :pay_type
  end
end
