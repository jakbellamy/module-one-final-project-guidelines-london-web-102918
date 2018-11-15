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
  puts "Please enter a valid command"
  puts "- - - - - - - - - - - - -"
end

def options_reminder
  puts "- - - - - - - - - - - - -"
  puts "Press enter for a reminder of the options"
  puts "- - - - - - - - - - - - -"
  gets.chomp
end

def input_not_found
  puts "- - - - - - - - - - - - -"
  puts "Alas, that cannot be found. Please check your spelling, perhaps? Press enter to try again"
  puts "- - - - - - - - - - - - -"
  gets.chomp
end
