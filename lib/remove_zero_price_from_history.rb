PriceHistory.where("price <= 0").destroy_all
Product.all.each do |p|
  if p.price_histories.length==0
    p.price_histories.create(price: p.price, updated_at: p.updated_at, created_at: p.updated_at)
  end
end