#----WELCOME AND LOGIN----

def welcome
  add_beer_icons
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
end

def login_prompt
  add_beer_icons
  puts "Please enter your user name"
  add_beer_icons
  puts "Type here:"
  gets.chomp.downcase
end

def invalid_input
  add_beer_icons
  puts "That command could not be recognized, please try again"
end

def options_reminder
  add_beer_icons
  puts "Please press enter for a reminder of the options"
  gets.chomp
end

def input_not_found
  add_beer_icons
  puts "Alas, that cannot be found. Please press enter to try again"
  gets.chomp
end

def add_beer_icons
  puts ""
  puts "\u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A}"
  puts ""
end

def log_out
  add_beer_icons
  puts "Had enough beer, eh? See you next time!"
  add_beer_icons
end
