#----BREWERY METHODS----

def brewery_search_options
  puts "Please type '1' to search by brewery name"
  puts "Please type '2' to search by your location"
  puts "Please type '3' to search  by a new location"
end


def find_brewery
  brewery_search_options
  puts "Type here:"
  user_input = gets.chomp
  case user_input
  when "1"
    brewery_by_name
  when "2"
    brewery_by_user_loc
  when "3"
    brewery_by_location
  when "main"
    main_menu_options
  else
    invalid_input
  end
end

def brewery_by_name
  add_beer_icons
  puts "Please enter the name of a brewery"
  puts "Type here:"
  user_input = gets.chomp
  brewery = Brewery.find_by(name: user_input)
  add_beer_icons
  puts "#{brewery.name} is in #{brewery.city}, #{brewery.country}. Find out more from their website #{brewery.url}"
  add_beer_icons
  main_menu_options
end

def brewery_by_user_loc
  user_loc_brewery_list = Brewery.all.select {|b| b.country == User.all[0]}

  if user_loc_brewery_list.length >= 1
    add_beer_icons
    user_loc_brewery_list.each do |brewery| 
      puts "#{brewery.name}."
    end
    add_beer_icons
  else
    add_beer_icons
      puts "Sorry, there are no breweries where you live. Maybe you should consider moving..."
    add_beer_icons
  end
  main_menu_options
end

def brewery_by_location
  add_beer_icons
  #Change to allow searching for city or country
  puts "Please enter the name of a city." 
  puts "Type here:"
  user_input = gets.chomp
  brewery_list = Brewery.all.select {|brewery| brewery.city == user_input}

  #Change to allow for searching non exact user_inputs
  if brewery_list.length >= 1 
    brewery_list = Brewery.all.select {|brewery| brewery.city == user_input}
    puts "Here are a list of breweries in #{user_input}:"
    i = 1
    brewery_list.each do |brewery|
      puts "#{i}. #{brewery.name} (#{brewery.country})"
      i += 1
    end
  else
    puts "Sorry there are no breweries there or you're making cities up again."
    "Please try again."
    brewery_by_location
  end
    
  main_menu_options

end

#----KENAN PRIVATE METHODS----

def get_user_input
  gets.chomp
end