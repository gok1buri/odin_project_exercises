urls = %w(
  )

#this will extract slug from each url in your arrayed 
slugs = urls.map do |url|
    url = url.split("?").first
    url = url.split("items/").last
end


slugs = ['introduction-to-the-finsa',
'reglementation-des-activites-transfrontieres-cross-border-28-8-22',
'introduction-a-la-lsfin']

slugs.each do |slug|
    if Item.find_by(slug: slug).elearning_packages.empty?
      puts slug
    else
        puts "in progress #{slug}"
      scorm_item = Item.find_by(slug:slug)
      elearning_package = scorm_item.elearning_packages.first 
      key = "copied_from_rustici/#{scorm_item.slug}.zip"
      RusticiEngine.copy_course_zip_to_s3(elearning_package, key: key)
  end
end