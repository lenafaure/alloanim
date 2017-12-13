class CirconscriptionsController < ApplicationController
  before_action :set_circonscription, only: [:show, :edit, :update, :destroy]

  # GET /circonscriptions
  # GET /circonscriptions.json
  def index
    @circonscriptions = Circonscription.all
  end

  # GET /circonscriptions/1
  # GET /circonscriptions/1.json
  def show
  end

  # GET /circonscriptions/new
  def new
    @circonscription = Circonscription.new
  end

  # GET /circonscriptions/1/edit
  def edit
  end

  # POST /circonscriptions
  # POST /circonscriptions.json
  def create
    @circonscription = Circonscription.new(circonscription_params)

    respond_to do |format|
      if @circonscription.save
        format.html { redirect_to @circonscription, notice: 'Circonscription was successfully created.' }
        format.json { render :show, status: :created, location: @circonscription }
      else
        format.html { render :new }
        format.json { render json: @circonscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circonscriptions/1
  # PATCH/PUT /circonscriptions/1.json
  def update
    respond_to do |format|
      if @circonscription.update(circonscription_params)
        format.html { redirect_to @circonscription, notice: 'Circonscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @circonscription }
      else
        format.html { render :edit }
        format.json { render json: @circonscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circonscriptions/1
  # DELETE /circonscriptions/1.json
  def destroy
    @circonscription.destroy
    respond_to do |format|
      format.html { redirect_to circonscriptions_url, notice: 'Circonscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circonscription
      @circonscription = Circonscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circonscription_params
      params.require(:circonscription).permit(:name)
    end
end
