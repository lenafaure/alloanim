# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 1.minute do
  rake "matches_notification"
end

every 1.day, :at => '11:10 am' do
  rake "matches_notification"
end

# Learn more: http://github.com/javan/whenever
