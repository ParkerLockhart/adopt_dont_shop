class RemoveAddressFromApplication < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :address, :string
  end
end
