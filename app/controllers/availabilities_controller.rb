class AvailabilitiesController < ApplicationController

  before_action :authenticate_user!

  def index
    @availability = Availability.all;
  end

  def show

  end

  def create
    @availability = current_user.availabilities.create(availability_params)
    redirect_to @availability.user, notice: "Success! " + @availability.date + @availability.time_slot
  end

  private
  def availability_params
    params.require(:availability).permit(:date, :time_slot);
  end


end