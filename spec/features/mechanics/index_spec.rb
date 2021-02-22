require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  it "displays all mechanics names and years of experiences" do
    bob = Mechanic.create!(name: "Bob Gurr", years_experience: 75)
    tony = Mechanic.create!(name: "Tony Baxter", years_experience: 45)
    joe = Mechanic.create!(name: "Joe Rohde", years_experience: 40)
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    within(".mechanic-#{bob.id}") do
      expect(page).to have_content(bob.name)
      expect(page).to have_content(bob.years_experience)
    end
    within(".mechanic-#{tony.id}") do
      expect(page).to have_content(tony.name)
      expect(page).to have_content(tony.years_experience)
    end
    within(".mechanic-#{joe.id}") do
      expect(page).to have_content(joe.name)
      expect(page).to have_content(joe.years_experience)
    end
  end
end
