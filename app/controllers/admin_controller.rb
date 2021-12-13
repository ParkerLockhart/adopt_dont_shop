class AdminController < ApplicationController
  def shelters
    @shelters = Shelter.order_by_name
    @pending = Shelter.pending_applications
  end
end
