PriceHistory.where("price <= 0").destroy_all
Product.all.each do |p|
  if p.price_histories.length==0
    p.price_histories.create(price: p.price, updated_at: p.updated_at, created_at: p.updated_at)
  end
end
Product.all.each do |p|
  dup=[]
  for i in 1...p.price_histories.length
    if p.price_histories[i].price==p.price_histories[i-1].price
      dup<<p.price_histories[i-1]
    end
  end
  if !dup.empty?
    puts dup.map {|ph| "#{ph.product.name} #{ph.price}"}.join(", ")
    dup.each{|ph| ph.destroy }
  end
end
