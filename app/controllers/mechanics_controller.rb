class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end
  def show
    @mechanic = Mechanic.find(params[:id])
  end
  def create
    @mechanic = Mechanic.new(mechanics_params)
    @mechanic.save
    redirect_to "/mechanics"
  end
  private
  def mechanics_params
    params.permit(:name, :years_experience)
  end
end
