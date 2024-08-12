c = Company.find_by(subdomain: 'learnamptesting')
l = Carousel.find 15433
l.carousel_tiles.includes(:learnlistable).each do |li|
  puts "#{li.id} - #{li.learnlistable.company.subdomain} - #{li.learnlistable.name}"

end; 0



c.active_libraries.include?(a)