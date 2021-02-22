require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  it "displays a Mechanics name and years of experience" do
    bob = Mechanic.create!(name: "Bob Gurr", years_experience: 75)
    visit "/mechanics/#{bob.id}"

    expect(page).to have_content(bob.name)
    expect(page).to have_content(bob.years_experience)
  end

  it 'displays a list of all open rides the mechanic is working on, sorted by thrill rating' do
    bob = Mechanic.create!(name: "Bob Gurr", years_experience: 75)
    mansion = bob.rides.create!(name: "Haunted Mansion", thrill_rating: 6, open: true)
    pirates = bob.rides.create!(name: "Pirates of the Caribean", thrill_rating: 7, open: true)
    space = bob.rides.create!(name: "Space Mountain", thrill_rating: 9, open: true)
    boats = bob.rides.create!(name: "Mike Fink Keel Boats", thrill_rating: 2, open: false)
    visit "/mechanics/#{bob.id}"

    expect(page).to have_content("Rides they are working on:")
    expect(page).to have_content(space.name)
    expect(page).to have_content(pirates.name)
    expect(page).to have_content(mansion.name)
    expect(page).to_not have_content(boats.name)
  end

  it 'can add ride by id' do
    bob = Mechanic.create!(name: "Bob Gurr", years_experience: 75)
    mansion = bob.rides.create!(name: "Haunted Mansion", thrill_rating: 6, open: true)
    pirates = Ride.create!(name: "Pirates of the Caribean", thrill_rating: 7, open: true)
    visit "/mechanics/#{bob.id}"

    expect(page).to have_field(:add_ride)
    expect(page).to have_button('Submit')

    fill_in "add_ride", with: "#{pirates.id}"
    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{bob.id}")
    expect(page).to have_content(pirates.name)
    expect(page).to have_content(mansion.name)
  end
end
