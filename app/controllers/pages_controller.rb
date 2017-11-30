class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to user_matching_offers_path(current_user)
    end

    if center_signed_in?
      redirect_to users_path
    end
  end


end