class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @centers = Center.all.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @center.update(center_params)
      redirect_to centers_path(@center), notice: "L'élément a été modifié avec succès"
    else
      render :edit
    end
  end

  def destroy
    @center.destroy
    respond_to do |format|
      format.html { redirect_to centers_url, notice: "L'élément a bien été supprimé" }
      format.json { head :no_content }
    end
  end

  private
  def set_center
    @center = Center.find(params[:id])
  end

  def center_params
    params.require(:center).permit(:first_name, :last_name, :email, :circonscription, :phone_number)
  end

end
