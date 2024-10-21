in gemfile
gem 'whenever', require: false

add bundle install

this below in config.schedule.rb


set :output, "./log/cron.log"

every 1.day, at: ['12:30 pm', '11:30 pm'] do
  runner "ApiFetcher.fetch_and_save_data"
end

set :output, "./log/cron.log"

# every 1.day, at: '8:00 pm'  do
#     runner 'CreateLeaveForInactiveUsersJob.perform_now'
# end
  
set :output, "./log/cron.log"

# every 1.day, at: '9:00 pm' do
#   runner "SendPendingStatusReminderJob.perform_now"
# end

every 1.day, at: '12:00 am' do
  runner "UpdateWeekOffStatusJob.perform_now"
end

every 2.minutes do
  runner "LeaveType.credit_leaves"
end



suppose this above is schedular file  whenvern you update this file run below command to update the schedulat
whenever --update-crontab

to see no of jobs running in the schedular file run below command 

crontab -l

to start schedular

sudo service cron start  # Or
sudo systemctl start cron


to stop

sudo service cron stop  # On Ubuntu/Debian
or 
sudo systemctl stop cron
