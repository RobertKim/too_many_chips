require 'sidekiq'
require 'sidekiq-status'

# Sidekiq.configure_client do |config|
#   config.client_middleware do |chain|
#     chain.add Sidekiq::Status::ClientMiddleware
#   end
# end

# Sidekiq.configure_server do |config|
#   config.server_middleware do |chain|
#     chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
#   end
# end


# sidekiq_redis = { url: $redis.url, namespace: 'sidekiq' }

# Sidekiq.configure_server { |config| config.redis = sidekiq_redis }
# Sidekiq.configure_client { |config| config.redis = sidekiq_redis }
Sidekiq.configure_server do |config|
  config.redis = { url: ENV["OPENREDIS_URL"] }
end unless ENV['OPENREDIS_URL'].blank?

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["OPENREDIS_URL"] }
end unless ENV['OPENREDIS_URL'].blank?