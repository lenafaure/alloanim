
task :matches_notification => :environment do

  User.find_each do |user|
    UserNotifierMailer.send_matches_notification(user).deliver
  end

end