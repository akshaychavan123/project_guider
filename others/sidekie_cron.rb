instead of Whenever gem following is the alternative solution for the jobs or tasks to be schedule.

in gemfile
gem 'sidekiq'
gem 'sidekiq-cron'

procfile
# web: npm run start
web: bundle exec rails server -b 0.0.0.0 -p $PORT
worker: bundle exec sidekiq

in config/initializers/sidekiq.rb

require 'sidekiq'
require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  if Rails.env.production?
    config.redis = { url: ENV['REDIS_URL'], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } } if ENV['REDIS_URL'].include?('rediss')
    config.redis = { url: ENV['REDIS_URL'] } unless ENV['REDIS_URL'].include?('rediss')
  else
    config.redis = { url: 'redis://127.0.0.1:6379' }
  end
end

Sidekiq.configure_client do |config|
  if Rails.env.production?
    config.redis = { url: ENV['REDIS_URL'], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } } if ENV['REDIS_URL'].include?('rediss')
    config.redis = { url: ENV['REDIS_URL'] } unless ENV['REDIS_URL'].include?('rediss')
  else
    config.redis = { url: 'redis://localhost:6379/0' }
  end
end

Sidekiq::Cron::Job.create(
  name: 'Status Tracker - every 30 minutes',
  cron: '*/3 * * * *',
  class: 'StatusTrackerJob'
)


and the actual JOb od Sidekiq To Perform

class StatusTrackerJob
  include Sidekiq::Job

  def perform(*args)
    check_in_outs = CheckInOut.where.not(check_in: nil).where(check_out: nil)
    Rails.logger.info "Found #{check_in_outs.count} records to process."

    check_in_outs.each do |record|
      TrackingLog.create!(
        emp_code: record.emp_code,
        latitude: record.latitude,
        longitude: record.longitude,
        tracked_at: Time.current,
        user: record.user,
        status: 'Checked In'
      )
    end
  rescue => e
    Rails.logger.error "Failed to create tracking log: #{e.message}"
  end
end



this all about code 

make sure you have redis instaled and enabled check redis by below
redis-cli
ping
you should get
pong

on the one terminal run rails s
and another terminal bundle exec sidekiq


