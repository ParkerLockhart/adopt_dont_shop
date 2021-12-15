class Admin::ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    if params[:approve].present?
      @application_pet = ApplicationPet.find(params[:approve])
      @application_pet.update(approved: true)
      redirect_to "/admin/applications/#{@application.id}"
    elsif params[:reject].present?
      @application_pet = ApplicationPet.find(params[:reject])
      @application_pet.update(rejected: true)
      redirect_to "/admin/applications/#{@application.id}"
    end
  end
end
