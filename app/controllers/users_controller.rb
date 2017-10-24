class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this
  before_action :search,  only: [:index]
  load_and_authorize_resource


  # GET /users
  # GET /users.json
  def index
      @users = User.all
  end

  # # GET /users/1
  # # GET /users/1.json
  def show
    @user = User.find(params[:id]);
    @matches = User.offer_matches(@user)
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Define root page when user logged in
  def current_user_home
    redirect_to current_user
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password, :email)
  end


  def search
    @search = User.ransack(params[:q])
    @user_availabilities = @search.result(distinct: true).includes(:availabilities)
  end

end
