class AvailabilitiesController < ApplicationController

  before_action :authenticate_user!

  def index
    @availability = Availability.all;
  end

  def show

  end

  def create
    # drop records before saving new set
    Availability.where(user_id: current_user.id).destroy_all

    # retrieve availabilities array from localStorage
    @availabilities = params[:availability]

    @availabilities.each do |index, availability|
      booked_slots = {};
      availability.each do |slot|
        booked_slots[:date] = availability[0]
        booked_slots[:time_slot] = availability[1]
      end
      @availability = current_user.availabilities.create(booked_slots)
    end

    redirect_to @availability.user, notice: "Vos modifications ont bien été enregistrées"
  end


  private
  def availability_params
    params.require(:availability).permit(:date, :time_slot);
  end

end