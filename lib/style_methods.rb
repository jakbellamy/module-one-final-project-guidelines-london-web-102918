#----STYLES----

def list_beer_styles
  puts "- - - - - - - - - - - - -"
  Style.all.map do |s|
  puts "#{s.name} (catalogue number: #{s.id})"
  end
  puts "- - - - - - - - - - - - -"
  main_menu_options
end
