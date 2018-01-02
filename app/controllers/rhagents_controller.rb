class RhagentsController < ApplicationController
  before_action :set_rhagent, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def show
  end

  def update
    if @rhagent.update(rhagent_params)
      redirect_to rhagents_path(@rhagent), notice: "L'élément a été modifié avec succès"
    else
      render :edit
    end
  end

  def destroy
    @rhagent.destroy
    respond_to do |format|
      format.html { redirect_to rhagents_url, notice: "L'élément a bien été supprimé" }
      format.json { head :no_content }
    end
  end

  private
  def set_rhagent
    @rhagent = Rhagent.find(params[:id])
  end

  def rhagent_params
    params.require(:rhagent).permit(:first_name, :last_name, :email, :circonscription, :approved)
  end

end