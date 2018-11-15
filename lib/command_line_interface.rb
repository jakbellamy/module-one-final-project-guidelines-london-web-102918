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

def help_list_of_commands
  puts "MAIN MENU"
  puts "Please type '1' if you want BeerMe to BeerYou!"
  puts "Please type '2' to search for a beer"
  puts "Please type '3' to search for a brewery"
  puts "Please type '4' to see a list of all beer styles"
  puts "Please type 'help' at any time to return to the MAIN MENU"
end

 def help
  help_list_of_commands
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

def brewery_search_request_help
  puts "Type '1' to search by Brewery Name"
  puts  "Type '2' to search by your location"
  puts "Type '3' to search  by a new Location"
end

def brewery_search_request_test(user_input)

  case brew
    if brewery_search_request = 1
        Brewery.find_by(name)
end

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
    beer_by__style
  else
    invalid_input
  end
end

def beer_search_options
  puts "Please type '1' to search by name"
  puts "Please type '2' to search by brewery"
  puts "Please type '3' to search by abv"
  puts "Please type '4' to search by style"
end

def beer_by_name
  user_input = gets.chomp
  beer = Beer.find_by(name: user_input)
  puts "#{beer.name} is a #{beer.style.name} made by #{beer.brewery.name}, with an abv of #{beer.abv}"
end

def beer_by_brewery
  user_input = gets.chomp
  beers = Beer.select {|beer| beer.brewery.name == user_input}
  puts beers
end

def beer_by_abv
  user_input = gets.chomp
  beers = Beer.select {|beer| beer.abv == (user_input)}
  beers.first(10)
end

def beer_by_style
  user_input = gets.chomp
  beers = Beer.select {|beer| beer.style == user_input}
  beers.first(10)
end
#
find_beer
