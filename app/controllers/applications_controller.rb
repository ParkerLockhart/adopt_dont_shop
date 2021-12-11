class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    if params[:search].present?
      @pets = Pet.search(params[:search])
    end

    if params[:adoption_id].present?
      @pet = Pet.find(params[:adoption_id])
      ApplicationPet.create!(application: @application, pet: @pet)
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to '/applications/new'
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

private

  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end

end
