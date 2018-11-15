#----MAIN MENU----

def main_menu_options_prompt
  puts "- - - - - - - - - - - - -"
  puts "MAIN MENU"
  puts "- - - - - - - - - - - - -"
  puts "Please type '1' if you want BeerMe to BeerYou!"
  puts "Please type '2' to search for a beer"
  puts "Please type '3' to search for a brewery"
  puts "Please type '4' to see a list of all beer styles"
  puts "Please type 'main' at any time to return to the MAIN MENU"
  puts "- - - - - - - - - - - - -"
end

def main_menu_options
  main_menu_options_prompt
  puts "Type here:"
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
