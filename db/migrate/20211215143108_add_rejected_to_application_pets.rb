class AddRejectedToApplicationPets < ActiveRecord::Migration[5.2]
  def change
    add_column :application_pets, :rejected, :boolean
  end
end
