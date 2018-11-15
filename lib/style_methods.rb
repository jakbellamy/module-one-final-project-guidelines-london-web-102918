#----STYLES----

def list_beer_styles
  add_beer_icons
  Style.all.map do |s|
  puts "#{s.name} (catalogue number: #{s.id})"
  end
  add_beer_icons
  main_menu_options
end
