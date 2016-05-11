Product.all.each do |p|
  Product.update_counters p.id, :alerts_count => p.alerts.count
end