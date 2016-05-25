Product.all.each do |p|
  Product.update_counters p.id, :price_histories_count => p.price_histories.count
end