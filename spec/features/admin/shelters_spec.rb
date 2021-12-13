require 'rails_helper'

RSpec.describe 'admin shelter index page' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    visit '/admin'
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
    #look at each shelter
    #look at each of the pets
    #look at each pet's applications to see if status == pending
    #Shelter.where(pets.where(Application.pending))

  end
end
