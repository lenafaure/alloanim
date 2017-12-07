class UserNotifierMailer < ApplicationMailer
  default :from => "AlloAnim <alloanim@futur.paris>"

  # Send notifications daily when user has matches
  def send_matches_notification(user)
    @user = user
    @matches = User.offer_matches(@user)
    if @matches.present?
      mail( :to => @user.email,
            :Bcc => "christian.bockarie@paris.fr",
            :subject => 'Vous avez ' + @matches.count.to_s + ' nouvelle(s) offre(s) sur AlloAnim' ) do |format|
        format.html(content_transfer_encoding: "7bit")
      end
    end
  end

  # Send offers to Users with no matches on Monday and Wednesday
  def send_current_offers(user)
    @user = user
    @matches = User.offer_matches(@user)
    @day_of_week = Time.now.utc.wday
    @offers = Offer.all.order(:date).where('date >= ?', DateTime.now.to_date).limit(5)

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
