class AlertMailer < ApplicationMailer
  def price_drop_alert(alert)
    @user = alert.user
    @alert = alert
    @product = alert.product
    mail to: @user.email, subject: "#{@product.name} price drops to $#{@product.price}"
  end
end