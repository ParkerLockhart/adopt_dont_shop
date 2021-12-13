require 'rails_helper'

RSpec.describe 'admin shelter index page' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @pet_4 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 5, adoptable: true)

    @app_1 = Application.create!(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "Pending")
    @app_2 = Application.create!(name: "Jason", street_address: "7229 Warp Dr.", city: "Orion", state: "CO", zip_code: "80918", description: "description", status: "In Progress")

    @app_1.pets << @pet_2
    @app_2.pets << @pet_3

    visit '/admin/shelters'
  end

  it 'shows all shelters in reverse alphabetical order' do
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
    expect(page).to have_content(@shelter_3.name)

    expect(@shelter_2.name).to appear_before(@shelter_3.name)
    expect(@shelter_2.name).to appear_before(@shelter_1.name)
    expect(@shelter_3.name).to appear_before(@shelter_1.name)
  end

  it 'shows all shelters with pending applications' do
    # look at each shelter
    # look at each of the pets
    # look at each pet's applications to see if status == pending
    # Shelter.where(pets.where(Application.pending))
    within("#admin-shelters-pending") do
      expect(page).to have_content(@shelter_1.name)
    end
  end
end
