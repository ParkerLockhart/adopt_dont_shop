require 'rails_helper'

RSpec.describe 'application new page' do
  it 'can create a new application' do
    visit "/applications/new"

    fill_in('name', with: 'Jenna')
    fill_in('street_address', with: '890 Aspen Falls')
    fill_in('city', with: 'Eden')
    fill_in('state', with: 'CO')
    fill_in('zip_code', with: '80918')
    click_button('Submit')
    application = Application.last

    expect(current_path).to eq("/applications/#{application.id}")
    expect(page).to have_content('Jenna')
    expect(page).to have_content('890 Aspen Falls')
    expect(page).to have_content('Eden')
    expect(page).to have_content('CO')
    expect(page).to have_content('80918')
  end
end
