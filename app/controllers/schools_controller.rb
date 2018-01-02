class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def edit
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

  def update
    if @school.update(school_params)
      redirect_to schools_path(@school), notice: "L'Ecole a été modifiée avec succès"
    else
      render :edit
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