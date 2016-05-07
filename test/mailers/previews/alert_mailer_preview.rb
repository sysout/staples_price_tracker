# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview
  def price_drop_alert
    alert = Alert.first
    AlertMailer.price_drop_alert(alert, alert.product)
  end
end
