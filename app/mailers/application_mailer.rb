class ApplicationMailer < ActionMailer::Base
  default from: "noreply@#{ENV['APP_DOMAIN_NAME']}"
  layout 'mailer'
end
