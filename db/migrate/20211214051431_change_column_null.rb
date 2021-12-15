class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :application_pets, :approved, false
    change_column :application_pets, :approved, :boolean, default: false
  end
end
