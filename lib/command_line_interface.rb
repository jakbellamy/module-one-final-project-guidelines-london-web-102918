require_all 'app'

#----WELCOME AND LOGIN----

def welcome
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
end

def login_prompt
  puts "Please enter your user name"
  gets.chomp.downcase
end

#----MAIN MENU----

def main_menu_options_prompt
  puts "MAIN MENU"
  puts "- - - - - - - - - - - - -"
  puts "Please type '1' if you want BeerMe to BeerYou!"
  puts "Please type '2' to search for a beer"
  puts "Please type '3' to search for a brewery"
  puts "Please type '4' to see a list of all beer styles"
  puts "Please type 'main' at any time to return to the MAIN MENU"
end

def main_menu_options
  main_menu_options_prompt
  user_input = gets.chomp
  case user_input
    when "1"
      beer_me
    when "2"
      find_beer
    when "3"
      find_brewery
    when "4"
      list_beer_styles
    when "main"
      main_menu_options
    else
      invalid_input
  end
end

#----STYLES----

def list_beer_styles
  Style.all.map do |s|
    "#{s.name} (catalogue number: #{s.id})"
  end
end

#----BEER ME RANDOM GENERATOR----

def beer_me
  random_beer = Beer.all.sample
  "Too lazy (or drunk) to choose your own beer? No problem! Why don't you try the #{random_beer.name} made by #{random_beer.brewery.name}? With an ABV of #{random_beer.abv}, it's sure to warm your cockles (if that's your thing)!"
end

#----BREWERY METHODS----

# def brewery_search_request_help
#   puts "Type '1' to search by Brewery Name"
#   puts "Type '2' to search by your location"
#   puts "Type '3' to search  by a new location"
# end
#
# def brewery_search_request_test(user_input)
#   case brew
#   when brewery_search_request == 1
#         Brewery.find_by(name)
#   end
# end

# def get_user_input
#   gets.strip
# end

def invalid_input
  puts "Please enter a valid command"
end

#----BEER SEARCH METHODS----

def find_beer
  beer_search_options
  user_input = gets.chomp

  case user_input
  when "1"
    beer_by_name
  when "2"
    beer_by_brewery
  when "3"
    beer_by_abv
  when "4"
    beer_by_style
  else
    invalid_input
  end
end

def beer_search_options
  puts "BEER SEARCH"
  puts "- - - - - - - - - - - - -"
  puts "Please type '1' to search by name"
  puts "Please type '2' to search by brewery"
  puts "Please type '3' to search by abv"
  puts "Please type '4' to search by style"
end

def beer_by_name
  puts "Please enter the name of your beer"
  user_input = gets.chomp
  beer = Beer.find_by(name: user_input)
  puts "#{beer.name} is a/an #{beer.style.name} made by #{beer.brewery.name}, with an abv of #{beer.abv}"
end

def beer_by_brewery
  puts "Please enter the name of a brewery to see their beers"
  user_input = gets.chomp
  brewery = Brewery.find_by(name: user_input)
  beers = brewery.beers
  beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
end

def beer_by_abv
  puts "Please enter an abv to see ten beers with a similar abv"
  user_input = gets.chomp.to_f
  beers = Beer.all.select {|beer| beer.abv == user_input}.sample(10) # (user_input >= 1 || user_input <= 1)}
  beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
end

def beer_by_style
  puts "Please enter the name of a style to see beers of that style"
  user_input = gets.chomp
  style = Style.find_by(name: user_input)
  beers = style.beers
  beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
end
