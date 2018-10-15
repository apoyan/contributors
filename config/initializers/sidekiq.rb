Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDISTOGO_URL", "redis://localhost:6379"), size: 5 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDISTOGO_URL", "redis://localhost:6379"), size: 5 }
end
