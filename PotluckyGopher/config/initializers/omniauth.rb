OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '505556099515765', 'e69b8e34f1011bf7c5aac0be544faa42'
end