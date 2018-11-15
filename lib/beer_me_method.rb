#----BEER ME RANDOM GENERATOR----

def beer_me
  puts "- - - - - - - - - - - - -"
  random_beer = Beer.all.sample
  puts "Too lazy (or drunk) to choose your own beer? No problem! Why don't you try the #{random_beer.name} made by #{random_beer.brewery.name}? With an ABV of #{random_beer.abv}, it's sure to warm your cockles (if that's your thing)!"
  puts "- - - - - - - - - - - - -"
  main_menu_options
end
