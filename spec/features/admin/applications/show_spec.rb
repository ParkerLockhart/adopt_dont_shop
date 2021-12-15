require 'rails_helper'

RSpec.describe 'admin applications show page' do
  before(:each) do
    @shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_4 = Shelter.create!(name: "City Rescue", city: "Starfield, TX", rank: 4, foster_program: true)

    @lucy = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter_1.id)
    @lobster = Pet.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter_1.id)
    @pirate = @shelter_1.pets.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @clawdia = @shelter_1.pets.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @ahmet = @shelter_3.pets.create!(name: 'Ahmet', breed: 'tabby', age: 8, adoptable: true)
    @stitch = @shelter_4.pets.create!(name: "Stitch", breed: "Whatever", age: 3, adoptable: true)
    @ann = @shelter_1.pets.create!(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)

    @app_1 = Application.create!(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "In Progress")
    @app_2 = Application.create!(name: "Jason", street_address: "Warp Dr.", city: "Orion", state: "CO", zip_code: "80918", description: "Because", status: "In Progress")
    @app_1.pets << @stitch
    @app_1.pets << @lucy
    @app_2.pets << @ahmet
    @app_2.pets << @stitch
  end

  it 'shows pets on application' do
    visit "/admin/applications/#{@app_1.id}/"

    expect(page).to have_content(@stitch.name)
    expect(page).to have_content(@lucy.name)
  end

  it 'can approve pets on application' do
    visit "/admin/applications/#{@app_1.id}"
    within("#admin-application-#{@stitch.id}") do
      click_link("Approve")
    end
    expect(current_path).to eq("/admin/applications/#{@app_1.id}")
    expect(page).to have_content("Adoption status: APPROVED")
  end
end
