require 'rails_helper'

RSpec.describe 'application index page' do
  before(:each) do

    @shelter = Shelter.create!(name: "City Rescue", city: "Starfield", rank: 4, foster_program: true)
    @pet = Pet.create!(name: "Stitch", breed: "Whatever", age: 3, adoptable: true, shelter_id: @shelter.id )
    @application = Application.create!(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "In Progress")

    @application.pets << @pet
    visit '/applications'
  end

  it 'shows all applicant names' do
    expect(page).to have_content(@application.name)
  end
end 
