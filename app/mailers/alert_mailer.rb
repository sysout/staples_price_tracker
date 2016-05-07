class AlertMailer < ApplicationMailer
  def price_drop_alert(alert, product)
    @user = alert.user
    @alert = alert
    @product = product
    attachments.inline['image.jpg']=@product.load_image
    mail to: @user.email, subject: "#{@product.name} price drops to $#{@product.price}"
  end
end