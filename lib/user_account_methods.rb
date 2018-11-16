# methods below are inside the my account menu branch of the main menu
# start with most basic methods - adding to user_beers by name to create the join between beers and users

# see user_beers - realitively easy
# Can add a beer to user_beers but doesn't show unless you log out and back in.

# add beer by name

def user_account_options
  add_beer_icons
  puts "Please type '1' to see your beer list"
  puts "Please type '2' to modify your beer list"
  add_beer_icons
end

def user_account_loop
  add_beer_icons
  user_account_options
  add_beer_icons
  user_input = gets.chomp
  if user_input == "1"
    see_beer_list
  elsif user_input == "2"
    modify_beer_list
  elsif user_input == "3"
    delete_account
  else user_account_loop
  end
end

def see_beer_list
  $user.reload
  $user.beers.each {|beer| puts beer.name}
  main_menu_options
end

def modify_beer_list_options
  puts "Please type '1' to add a beer to your beer list"
  puts "Please type '2' to delete a beer from your beer list"
  puts "Please type '3' to delete all beers from your beer list"
end

def modify_beer_list
  modify_beer_list_options
  user_input = gets.chomp
  if user_input == "1"
    add_beer_to_beer_list
  elsif user_input == "2"
    delete_beer_from_beer_list
  elsif user_input == "3"
    delete_entire_beer_list
  else modify_beer_list
  end
end

def add_beer_to_beer_list
  puts "Please type the name of the beer you want to add to your beer list"
  user_input = gets.chomp
  beer = Beer.find_by(name: user_input)
  UserBeer.create(user_id: $user.id, beer_id: beer.id)
  puts "#{beer.name} was added to your beer list"
  main_menu_options
end

def delete_beer_from_beer_list
  puts "Please type the name of the beer you want to remove from your beer list"
  user_input = gets.chomp
  beer = Beer.find_by(name: user_input)
  UserBeer.where(user_id: $user.id, beer_id: beer.id).destroy_all
  puts "#{beer.name} was removed from your beer list"
  main_menu_options
end

def delete_entire_beer_list
  puts "Are you sure? Type 'clearmebeerme' to proceed, otherwise press enter to cancel"
  user_input = gets.chomp.downcase
  if user_input == "clearmebeerme"
    UserBeer.where(user_id: $user.id).destroy_all
    puts "Oh the humanity..."
    main_menu_options
  else
    main_menu_options
  end
end

def delete_account
  puts "Are you sure? Type 'SoberMeUp' to confirm"
  user_input = gets.chomp.downcase
  if user_input == "sobermeup"
    puts "Last chance, buddy, your liver might be happy, but will you be?"
    puts "Type 'MyDrinkingHasDestroyedMyLifeYesIAmSure' if you really don't love us any more"
    user_input2 = gets.chomp.downcase
    if user_input2 == "mydrinkinghasdestroyedmylifeyesiamsure"
      UserBeer.where(user_id: $user.id).destroy_all
      User.find_by(name: $user.name).destroy
      # $user.reload
      puts "'Hic'... More beer for us loser!"
    log_in
    end
  else
    puts "You won't regret it (your liver might though...)"
    main_menu_options
  end
end