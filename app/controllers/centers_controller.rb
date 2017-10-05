class CentersController < ApplicationController
  def show
    @center = Center.find(params[:id]);
  end

  def edit

  end
end
