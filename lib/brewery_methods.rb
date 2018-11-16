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
  user_loc_brewery_list = Brewery.all.select {|brewery| brewery.city == $user.city}
  if user_loc_brewery_list.length >= 1
    add_beer_icons
    user_loc_brewery_list.each_with_index do |brewery, i| 
      puts "#{i+1}. #{brewery.name}."
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
  non_nil_brewery_list = Brewery.all.reject {|brewery| brewery.city == nil}
  brewery_list = non_nil_brewery_list.select {|brewery| brewery.city.downcase == user_input.downcase}

  #Change to allow for searching non exact user_inputs
  if brewery_list.length >= 1 
    puts "Here are a list of breweries in #{user_input}:"
    brewery_list.each_with_index do |brewery, i|
      puts "#{i+1}. #{brewery.name} (#{brewery.country})"
    end
  else
    brewery_list = non_nil_brewery_list.select {|brewery| brewery.city.downcase.include?(user_input)}
    brewery_cities = brewery_list.map {|brewery| brewery.city}.uniq
    puts "Sorry you slurred your words. Did you mean one of these?"
    brewery_cities.each_with_index {|b_c, i| puts "#{i+1}. #{b_c}"}
    
    puts "Type the number of the city to see list of breweries or quit to return to main menu."
    puts "Type here:"
    user_input_city = gets.chomp
    brewery_list = brewery_list.select {|brewery| brewery.city == brewery_cities[user_input_city.to_i - 1]}

    puts "Here are a list of breweries in #{brewery_cities[user_input_city.to_i - 1]}:"
    brewery_list.each_with_index do |brewery, i|
      puts "#{i+1}. #{brewery.name} (#{brewery.country})"
    end

    # puts "Sorry there are no breweries there or you're making cities up again."
    # puts "Want another try?"
    # brewery_by_location
  end
    
  main_menu_options

end

def puts_brewery_list
  #for future factorising
end

#----KENAN PRIVATE METHODS----

def get_user_input
  gets.chomp
end