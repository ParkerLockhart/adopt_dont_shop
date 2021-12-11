require 'rails_helper'

RSpec.describe 'applications show page' do
  before(:each) do

    @shelter = Shelter.create!(name: "City Rescue", city: "Starfield", rank: 4, foster_program: true)
    @pet = Pet.create!(name: "Stitch", breed: "Whatever", age: 3, adoptable: true, shelter_id: @shelter.id )
    @application = Application.create!(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "In Progress")

    visit "/applications/#{@application.id}"
  end

  it 'shows applicant name' do
    expect(page).to have_content(@application.name)
  end

  it 'shows applicant address' do
    expect(page).to have_content(@application.street_address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip_code)
  end

  it 'shows applicant description' do
    expect(page).to have_content(@application.description)
  end

  it 'shows application status' do
    expect(page).to have_content(@application.status)
  end

  it 'can search for pets' do
    fill_in('search', with: 'Stitch')
    click_button('Search')

    expect(current_path).to eq("/applications/#{@application.id}")
    expect(page).to have_content('Stitch')
  end

  it 'can add pet to application' do
    fill_in('search', with: 'Stitch')
    click_button('Search')
    click_button('Adopt this Pet')

    expect(current_path).to eq("/applications/#{@application.id}")
    expect(@application.pets).to include(@pet)
  end
end
