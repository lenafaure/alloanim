class AvailabilitiesController < ApplicationController

  before_action :authenticate_user!

  def create
    @availability = current_user.availabilities.create(availability_params)
    redirect_to @availability.user, notice: "Success!"
  end

  private
  def availability_params
    params.require(:reservation).permit(:date, :time_slot);
  end


end