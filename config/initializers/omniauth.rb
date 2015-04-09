OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1420754628239729', '831630b79be72ec091dd22bfa4bde0f8'
end