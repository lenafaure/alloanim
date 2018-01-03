class UsersController < ApplicationController
  # User = Animateur
  before_action :set_user, only: [:show, :edit, :update]
  before_action :search, only: [:index]
  skip_before_action :completed_profile, only: [:edit, :update]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
  end

  def manage
    @users = User.all.order('approved ASC').order('created_at DESC')
    render :animateurs
  end

  # # GET /users/1
  # # GET /users/1.json
  def show
    @availabilities = @user.availabilities
    @age = User.age(@user)
    authorize! :show, @user
  end

  # GET /users/1/edit
  def edit
  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "L'animateur a été modifié avec succès." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Function for approving user manually (by Rhagent)
  def approve
    pending_user = User.find(params[:user_id])
    pending_user.update_attribute :approved, params[:approved]
    respond_to do |format|
      if (pending_user.approved == true)
        format.html { redirect_to animateurs_path, notice: 'Cet animateur a bien été validé' }
      else
        format.html { redirect_to animateurs_path, notice: 'Cet animateur a bien été mis en attente de validation' }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to animateurs_url, notice: "L'élément a bien été supprimé" }
      format.json { head :no_content }
    end
  end

  # Displays matching offers for this users
  def matching_offers
    @user = User.find(params[:user_id])
    @matches = User.offer_matches(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :email, :first_name, :last_name, :birthday, :soi_number, :phone_number, :circonscription, :diploma, :approved)
  end

  # Displays results on /users page
  def search
    @search = User.ransack(params[:q])
    @user_availabilities = @search.result(distinct: true).includes(:availabilities).order('last_name ASC').where('approved = ?', true).where.not(phone_number: [nil, ""], diploma: [nil, ""])
  end

end
