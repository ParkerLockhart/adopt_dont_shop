require 'rails_helper'

RSpec.describe 'applications show page' do
  before(:each) do

    @shelter = Shelter.create!(name: "City Rescue",
                                city: "Starfield",
                                rank: 4,
                                foster_program: true)
    @pet = Pet.create!(name: "Stitch" ,
                        breed: "Whatever",
                        age: 3,
                        adoptable: true,
                        shelter_id: @shelter.id )
    @application = Application.create!(name: "Amy",
                                      address: "5223 Lovely Ln., Starfield TX 78230",
                                      description: "I want to take care of a pet who needs help.",
                                      status: "In Progress")

    @application.pets << @pet
    visit "/applications/#{@application.id}"
  end

  it 'shows applicant name' do
    expect(page).to have_content(@application.name)
  end

  it 'shows applicant address' do
    expect(page).to have_content(@application.address)
  end

  it 'shows applicant description' do
    expect(page).to have_content(@application.description)
  end

  it 'shows application pets' do
    expect(page).to have_content(@pet.name)
  end

  it 'shows application status' do
    expect(page).to have_content(@application.status)
  end
end
