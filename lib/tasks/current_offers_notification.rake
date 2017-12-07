task :current_offers_notification => :environment do

  User.find_each do |user|
    UserNotifierMailer.send_current_offers(user).deliver
  end

end