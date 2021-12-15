class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :application_pets, :rejected, :boolean, default: false
    change_column_null :application_pets, :rejected, false
  end
end
