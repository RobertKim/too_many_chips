if ENV.has_key?("OPENREDIS_URL")
  uri = URI.parse(ENV["OPENREDIS_URL"])
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
elsif Rails.env.test?
  Rails.logger.warn "Using fake redis..."
  $redis = FakeRedis::Redis.new
else
  Rails.logger.warn "Using local redis daemon"
  $redis = Redis.new
end