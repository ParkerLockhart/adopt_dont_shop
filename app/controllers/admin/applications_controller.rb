class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if params[:approve].present?
      @application_pet = ApplicationPet.find(params[:approve])
      @application_pet.update(approved: true)
      redirect_to "/admin/applications/#{@application.id}"
    elsif params[:reject].present?

    end
  end
end
