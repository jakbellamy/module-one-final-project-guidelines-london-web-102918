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
  puts "- - - - - - - - - - - - -"
  puts "Please enter the name of a brewery"
  puts "- - - - - - - - - - - - -"
  puts "Type here:"
  user_input = gets.chomp
  brewery = Brewery.find_by(name: user_input)
  puts "- - - - - - - - - - - - -"
  puts "#{brewery.name} is in #{brewery.city}, #{brewery.country}. Find out more from their website #{brewery.url}"
  puts "- - - - - - - - - - - - -"
  main_menu_options
end


#----KENAN PRIVATE METHODS----

def get_user_input
  gets.chomp
end