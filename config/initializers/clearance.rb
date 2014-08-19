Clearance.configure do |config|
  config.allow_sign_up = false
  config.mailer_sender = 'no-reply@reactions.dev'
  config.cookie_domain = 'reactions.dev'
  config.redirect_url = '/admin'
end
