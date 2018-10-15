Sidekiq.configure_server do |config|
  config.redis = { driver: 'hiredis', url: ENV["REDISTOGO_URL"] }
end
