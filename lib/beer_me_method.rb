#----BEER ME RANDOM GENERATOR----

def beer_me
  puts "- - - - - - - - - - - - -"
  random_beer = Beer.all.sample
  puts "Too lazy (or drunk) to choose your own beer?"
  puts "No problem! Why don't you try the #{random_beer.name} made by #{random_beer.brewery.name}?"
  puts "With an ABV of #{random_beer.abv}, it's sure to warm your cockles"
  puts "(if that's your thing)!"
  puts "- - - - - - - - - - - - -"
  puts "And if that particular brew was NOT quite your thing..."
  beer_me_again_options
end

def beer_me_again
  puts "- - - - - - - - - - - - -"
  random_beer = Beer.all.sample
  puts "Well then choosy!"
  puts "Instead you could try the #{random_beer.name} made by #{random_beer.brewery.name}. It's abv is #{random_beer.abv}, but don't let that stop you!"
  puts "- - - - - - - - - - - - -"
  beer_me_again_options
end

def beer_me_again_prompt
  puts "...you could just type 'BeerMe' to go for it one more time!"
  puts "Otherwise, please type 'main' to return to the Main Menu"
end

def beer_me_again_options
  beer_me_again_prompt
  puts "Type here:"
  user_input = gets.chomp.downcase
  case user_input
  when "beerme"
    beer_me_again
  when "main"
    main_menu_options
  else
    invalid_input
  end
  beer_me_again_options
end
