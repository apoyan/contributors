Gush.configure do |config|
  config.redis_url = ENV.fetch("REDISTOGO_URL", "redis://localhost:6379")
  config.concurrency = 1
  config.ttl = 3600*24*7
end
