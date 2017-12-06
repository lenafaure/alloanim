class UserNotifierMailer < ApplicationMailer
  default :from => 'alloanim@futur.paris'
  def send_matches_notification(user)
    @user = user
    @matches = User.offer_matches(@user)
    if @matches.present?
      mail( :to => @user.email,
            :subject => 'Vous avez ' + @matches.count.to_s + ' nouvelle(s) offre(s) sur AlloAnim' ) do |format|
        format.html(content_transfer_encoding: "7bit")
      end
    end
  end
end
