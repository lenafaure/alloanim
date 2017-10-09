class CentersController < ApplicationController
  load_and_authorize_resource

  def show
    @center = Center.find(params[:id]);
  end

  def edit

  end
end
