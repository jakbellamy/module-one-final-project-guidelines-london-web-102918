def welcome
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
end

def login_prompt
  puts "Please enter your user name"
  gets.chomp.downcase
end

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

def list_beer_styles
  Style.all.map do |s|
    "#{s.name} (catalogue number: #{s.id})"
  end
end

def beer_me
  random_beer = Beer.all.sample
  puts "Too lazy (or drunk) to choose your own beer? No problem! Why don't you try the #{random_beer.name} made by #{random_beer.brewery.name}? With an ABV of #{random_beer.abv}, it's sure to warm your cockles (if that's your thing)!"
end
