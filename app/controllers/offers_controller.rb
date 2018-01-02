class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all.order(:date).where('date >= ?', DateTime.now.to_date).where('filled = ?', false)
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.center = current_center

      if @offer.save
         redirect_to offers_url, notice: "L'Offre a été créée avec succès"
      else
        render :new
      end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    @offer.center = current_center
    if @offer.update(offer_params)
      redirect_to center_path(current_center), notice: "L'Offre a été modifiée avec succès"
    else
      render :edit
    end
  end

  def mark_as_filled
    pending_offer = Offer.find(params[:offer_id])
    pending_offer.update_attribute :filled, params[:filled]
    respond_to do |format|
      if (pending_offer.filled == true)
        format.html { redirect_to center_path(current_center), notice: 'Cette offre a bien été marquée comme pourvue' }
      else
        format.html { redirect_to center_path(current_center), notice: 'Cette offre a bien été remise en ligne' }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:date, :offer_number, :filled, :school_id, :center_id, :diploma_ids => [], :slot_ids => []);
    end
end
