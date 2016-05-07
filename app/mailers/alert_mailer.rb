class AlertMailer < ApplicationMailer
  def price_drop_alert(alert, product)
    @user = alert.user
    @alert = alert
    @product = product
    mail to: @user.email, subject: "#{@product.name} price drops to $#{@product.price}"
  end
end