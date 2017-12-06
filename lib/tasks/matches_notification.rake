
task :matches_notification => :environment do

UserNotifierMailer.send_matches_notification(User.find(22)).deliver

  User.find_each do |user|
    UserNotifierMailer.send_matches_notification(user).deliver
  end

end