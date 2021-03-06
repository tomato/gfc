require 'factory_girl'

Factory.sequence :producer_name do |n|
  "Producer #{n}"
end

Factory.sequence :product_name do |n|
  "Product #{n}"
end

Factory.define :producer do |f|
  f.address  "
    The village hall
    Witham
    Essex
    CM8 3df"
  f.name Factory.next :producer_name
  f.tel  "4324280 08080980"
  f.website  "www.tomstomatoes.com"
  f.summary  "growing ripe red juic tomatoes"
  f.email  "tom@tomstomatoes.com"
  f.status "active"
end

Factory.define :question do |f|
  f.name "What are you doing"
  f.required true
end

Factory.define :admin, :class => :user do |u|
  u.login 'admin'
  u.password '12345'
  u.password_confirmation '12345'
  u.email 'tom@tomhowlett.com'
end

Factory.define :tom_thumb, :class => :user do |u|
  u.login 'tom thumb'
  u.password '12345'
  u.password_confirmation '12345'
  u.email 'tom@tomhowlett.com'
end

Factory.define :product do |p|
  p.name Factory.next :product_name
  p.description 'Tasty fish for the penguins'
  p.producer {|r| r.association(:producer, :name => Factory.next(:producer_name))}
end 

Factory.define :variant do |v|
  v.description 'big one'
  v.price '23'
  v.available true
  v.product {|p| p.association(:product, :name => Factory.next(:product_name))}
end
