class UserNotifierMailer < ApplicationMailer
  default :from => "AlloAnim <alloanim@futur.paris>"
  @day_of_week = Time.now.utc.wday

  # Send daily notifications when user has matches, except on weekends
  def send_matches_notification(user)
    @user = user
    @matches = User.offer_matches(@user)
    if (@day_of_week != 6 && @day_of_week != 7)
      if @matches.present?
        mail( :to => @user.email,
              :Bcc => "christian.bockarie@paris.fr",
              :subject => 'Vous avez ' + @matches.count.to_s + ' nouvelle(s) offre(s) sur AlloAnim' ) do |format|
          format.html(content_transfer_encoding: "7bit")
        end
      end
    end
  end

  # Send offers to users with no matches on Monday and Wednesday
  def send_current_offers(user)
    @user = user
    @matches = User.offer_matches(@user)
    @offers = Offer.all
                  .order(:date)
                  .where('date >= ?', DateTime.now.to_date)
                  .where('filled = ?', false)
                  .joins(:center)
                  .where(centers: {circonscription: @user.circonscription})
                  .limit(5)

    if (@day_of_week == 1 || @day_of_week == 3)
      if (@matches.blank? && @offers.present?)
        mail( :to => @user.email,
              :subject => 'Certaines de nos offres pourraient vous intéresser' ) do |format|
          format.html(content_transfer_encoding: "7bit")
        end
      end
    end
  end
end
