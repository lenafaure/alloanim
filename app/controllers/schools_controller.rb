class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def show
    @school = School.find(params[:id])
    @center = Center.find(@school.center_id)
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to school_path(@school), notice: 'School was successfully created.'
    else
     render 'new'
    end
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :address, :circonscription, :center_id)
    end

end