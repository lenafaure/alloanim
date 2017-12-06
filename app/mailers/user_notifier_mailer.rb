class UserNotifierMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'
  def send_matches_notification(user)
    @user = user
    @matches = User.offer_matches(@user)
    if @matches.present?
    puts @matches
    puts @user.email
    mail( :to => @user.email,
          :subject => 'You have a match' )
    end
  end
end
