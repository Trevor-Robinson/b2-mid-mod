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
  end
end
