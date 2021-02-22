require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe "class methods" do
    it "can calculate average years of experience of all mechanics" do
      bob = Mechanic.create!(name: "Bob Gurr", years_experience: 75)
      tony = Mechanic.create!(name: "Tony Baxter", years_experience: 45)
      joe = Mechanic.create!(name: "Joe Rohde", years_experience: 40)

      expect(Mechanic.average_years).to eq(53)
    end

    it "can sort rides working on" do
      bob = Mechanic.create!(name: "Bob Gurr", years_experience: 75)
      mansion = bob.rides.create!(name: "Haunted Mansion", thrill_rating: 6, open: true)
      pirates = bob.rides.create!(name: "Pirates of the Caribean", thrill_rating: 7, open: true)
      space = bob.rides.create!(name: "Space Mountain", thrill_rating: 9, open: true)
      boats = bob.rides.create!(name: "Mike Fink Keel Boats", thrill_rating: 2, open: false)

      expect(bob.sorted_rides.length).to eq(3)
      expect(bob.sorted_rides.first).to eq(space)
      expect(bob.sorted_rides.last).to eq(mansion)
      expect(bob.sorted_rides.include?(boats)).to eq(false)
    end
  end
end
