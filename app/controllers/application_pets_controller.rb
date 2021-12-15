class ApplicationPetsController < ApplicationController

  def update
    @application_pet = ApplicationPet.find(params[:id])
  end
end
