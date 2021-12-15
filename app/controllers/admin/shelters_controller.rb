class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.order_by_name
    @pending = Shelter.pending_applications
  end
end
