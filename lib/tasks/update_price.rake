require 'net/http'

namespace :update_price do
  desc "Update staples products price"
  task :start, [:arg1] => :environment do |t, args|
    logger           = Logger.new(STDOUT)
    logger.level     = Logger::INFO
    Rails.logger     = logger
    logger.info "Making the attempt to update the price"
    # find the oldest 10 products with alerts
    Product.joins(:alerts).where(
        'products.updated_at < :date',
        date: args[:arg1].to_i.minutes.ago).distinct.each do |product|
      logger.info "Only update product updated more than #{args[:arg1]} minutes ago"
      ActiveRecord::Base.transaction do
        begin
          current_price = product.current_price
          product.price=current_price
          Alert.eager_load(:user, :product).where(
              'alerts.desired >= :current_price and alerts.product_id=:product_id',
                      current_price: current_price, product_id:product.id).each do |alert|
            logger.info "Alerting #{alert.user.email} with #{alert.product.name}"
            AlertMailer.price_drop_alert(alert, product).deliver_now
          end
          product.touch
          product.save!
          logger.info "product.updated_at: #{product.updated_at}"
        rescue Exception => e
          ActiveRecord::Rollback
          logger.error  e
        end
      end
    end
  end
end