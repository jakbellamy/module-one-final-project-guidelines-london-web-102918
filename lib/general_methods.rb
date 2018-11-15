#----WELCOME AND LOGIN----

def welcome
  puts "- - - - - - - - - - - - -"
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
  puts "- - - - - - - - - - - - -"
end

def login_prompt
  puts "- - - - - - - - - - - - -"
  puts "Please enter your user name"
  puts "- - - - - - - - - - - - -"
  puts "Type here:"
  gets.chomp.downcase
end

def invalid_input
  puts "- - - - - - - - - - - - -"
  puts "That command could not be recognized, please try again"
  puts "- - - - - - - - - - - - -"
end

def options_reminder
  puts "- - - - - - - - - - - - -"
  puts "Please press enter for a reminder of the options"
  puts "- - - - - - - - - - - - -"
  gets.chomp
end

def input_not_found
  puts "- - - - - - - - - - - - -"
  puts "Alas, that cannot be found. Please press enter to try again"
  puts "- - - - - - - - - - - - -"
  gets.chomp
end

def add_beer_icons
  puts ""
  puts "\u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A} \u{1F37A}"
  puts ""
  end
