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
  main_menu_options
end
