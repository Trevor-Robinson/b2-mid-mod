class RideMechanicsController < ApplicationController
  def create
    ride_mechanic = RideMechanic.new(ride_id: params[:add_ride], mechanic_id: params[:id])
    ride_mechanic.save
    redirect_to "/mechanics/#{params[:id]}"
  end
end
