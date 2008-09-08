require 'factory_girl'

Factory.define :producer do |f|
  f.address  "
    The village hall
    Witham
    Essex
    CM8 3df"
  f.name  "Toms tomatoes"
  f.tel  "4324280 08080980"
  f.website  "www.tomstomatoes.com"
  f.summary  "growing ripe red juic tomatoes"
  f.email  "tom@tomstomatoes.com"
end

Factory.define :question do |f|
  f.name "What are you doing"
  f.required true
end
