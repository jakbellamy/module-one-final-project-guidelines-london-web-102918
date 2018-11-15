#----BEER SEARCH METHODS----

def find_beer
  beer_search_options
  puts "Type here:"
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
  when "main"
    main_menu_options
  else
    invalid_input
  end
end

def beer_search_options
  puts "- - - - - - - - - - - - -"
  puts "BEER SEARCH"
  puts "- - - - - - - - - - - - -"
  puts "Please type '1' to search by name"
  puts "Please type '2' to search by brewery"
  puts "Please type '3' to search by abv"
  puts "Please type '4' to search by style"
  puts "- - - - - - - - - - - - -"
end

def beer_by_name
  puts "- - - - - - - - - - - - -"
  puts "Please enter the name of your beer"
  puts "- - - - - - - - - - - - -"
  puts "Type here:"
  user_input = gets.chomp
  beer = Beer.find_by(name: user_input)
  puts "- - - - - - - - - - - - -"
  puts "#{beer.name} is a/an #{beer.style.name} made by #{beer.brewery.name}, with an abv of #{beer.abv}"
  puts "- - - - - - - - - - - - -"
  main_menu_options
end

def beer_by_brewery
  puts "- - - - - - - - - - - - -"
  puts "Please enter the name of a brewery to see their beers"
  puts "- - - - - - - - - - - - -"
  puts "Type here:"
  user_input = gets.chomp
  brewery = Brewery.find_by(name: user_input)
  beers = brewery.beers
  puts "- - - - - - - - - - - - -"
  beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
  puts "- - - - - - - - - - - - -"
  main_menu_options
end

def beer_by_abv
  puts "- - - - - - - - - - - - -"
  puts "Please enter an abv to see ten beers with a similar abv"
  puts "- - - - - - - - - - - - -"
  puts "Type here:"
  user_input = gets.chomp.to_f
  beers = Beer.all.select {|beer| beer.abv == user_input}.sample(10) # (user_input >= 1 || user_input <= 1)}
  puts "- - - - - - - - - - - - -"
  beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
  puts "- - - - - - - - - - - - -"
  main_menu_options
end

def beer_by_style
  puts "- - - - - - - - - - - - -"
  puts "Please enter the name of a style to see beers of that style"
  puts "- - - - - - - - - - - - -"
  puts "Type here:"
  user_input = gets.chomp
  puts "- - - - - - - - - - - - -"
  style = Style.find_by(name: user_input)
  beers = style.beers
  puts "- - - - - - - - - - - - -"
  beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
  puts "- - - - - - - - - - - - -"
  main_menu_options
end
