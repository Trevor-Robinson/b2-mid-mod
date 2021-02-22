class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years
    average(:years_experience).to_i
  end

  def sorted_rides
    rides.where(open: true).order("thrill_rating DESC")
  end
end
