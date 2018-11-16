#----BEER SEARCH METHODS----

def find_beer
  beer_search_options
  puts "Type here:"
  user_input = gets.chomp
  puts ""
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
  when "log out"
    log_out
  else
    invalid_input
  end
  options_reminder
  find_beer
end

def beer_search_options
  add_beer_icons
  puts "BEER SEARCH"
  add_beer_icons
  puts "Please type '1' to search by name"
  puts "Please type '2' to search by brewery"
  puts "Please type '3' to search by abv"
  puts "Please type '4' to search by style"
  puts "You can type 'main' at any time to return to the Main Menu"
  puts "Or type 'log out' to quit BeerMe.... We'll miss you!"
  add_beer_icons
end

def beer_by_name
  add_beer_icons
  puts "Please enter the name of your beer"
  add_beer_icons
  puts "Type here:"
  user_input = gets.chomp
  puts ""
  beer = Beer.find_by(name: user_input)
    if user_input == "main"
      main_menu_options
    elsif beer
      add_beer_icons
      puts "#{beer.name} is a/an #{beer.style.name} made by #{beer.brewery.name}, with an abv of #{beer.abv}"
      add_beer_icons
    else
      input_not_found
      beer_by_name
    end
end

def beer_by_brewery
  add_beer_icons
  puts "Please enter the name of a brewery to see their beers"
  add_beer_icons
  puts "Type here:"
  user_input = gets.chomp
  puts ""
  brewery = Brewery.find_by(name: user_input)
    if user_input == "main"
      main_menu_options
    elsif brewery
      beers = brewery.beers
      add_beer_icons
          beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
          add_beer_icons
      else
      input_not_found
      beer_by_brewery
    end
end

def beer_by_abv
  add_beer_icons
  puts "Please enter an abv to see ten beers with a similar abv"
  add_beer_icons
  puts "Type here:"
  user_input = gets.chomp.to_f
  puts ""
  beers = Beer.all.select {|beer| beer.abv == user_input}.sample(10) # (user_input >= 1 || user_input <= 1)}
    if user_input == "main"
      main_menu_options
    elsif beers.count > 0
      add_beer_icons
      beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
      add_beer_icons
    else
      input_not_found
      beer_by_abv
    end
end

def beer_by_style
  add_beer_icons
  puts "Please enter the name of a style to see beers of that style"
  add_beer_icons
  puts "Type here:"
  user_input = gets.chomp
  puts ""
  style = Style.find_by(name: user_input)
    if user_input == "main"
      main_menu_options
    elsif style
      beers = style.beers
      add_beer_icons
      beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
      add_beer_icons
    else
      input_not_found
      beer_by_style
    end
end

def beer_by_style_id
  add_beer_icons
  puts "Please enter the catalogue number of a style to see beers of that style"
  add_beer_icons
  puts "Type here:"
  user_input = gets.chomp
  puts ""
  style = Style.find_by(id: user_input)
    if user_input == "main"
      main_menu_options
    elsif style
      beers = style.beers
      add_beer_icons
      beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name}"}
      add_beer_icons
    else
      input_not_found
      beer_by_style
    end
end
