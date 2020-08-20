Paapi.configure do |config|
  config.access_key  = Rails.application.credentials[:pa_api][:access_key_id]
  config.secret_key  = Rails.application.credentials[:pa_api][:secret_key]
  config.partner_tag = Rails.application.credentials[:pa_api][:associate_tag]
end
