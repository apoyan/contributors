Sidekiq.configure_server do |config|
  config.redis = { driver: 'hiredis', url: 'redis://localhost:6379/0' }
end
