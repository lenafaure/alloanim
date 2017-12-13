desc 'Sends an email to Users with matches with an overview of their matches'

task :matches_notification => :environment do

  User.find_each do |user|
    UserNotifierMailer.send_matches_notification(user).deliver
  end

end