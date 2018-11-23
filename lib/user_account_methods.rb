# methods below are inside the my account menu branch of the main menu
# start with most basic methods - adding to user_beers by name to create the join between beers and users

# see user_beers - realitively easy
# Can add a beer to user_beers but doesn't show unless you log out and back in.

# add beer by name

def user_account_options
  add_beer_icons
  puts "Please type '1' to see your beer list"
  puts "Please type '2' to modify your beer list"
  puts "And by jiminy, if there's something wrong with"
  puts "you and you want to delete your account,"
  puts "then type '3' (fine then, be like that....)"
  add_beer_icons
end

def user_account_loop
  user_account_options
  puts "Type here:"
  user_input = gets.chomp
  puts ""
  if user_input == "1"
    see_beer_list
  elsif user_input == "2"
    modify_beer_list
  elsif user_input == "3"
    delete_account
  elsif user_input == "log out"
    log_in
  else
    invalid_input
  end
  options_reminder
  user_account_loop
end

def see_beer_list
  $user.reload
  if $user.beers.length == 0
    add_beer_icons
    puts "Your beer list is empty, silly!"
    options_reminder
    user_account_loop
  else
  add_beer_icons
  $user.beers.each {|beer| puts "#{beer.name}, #{beer.style.name}, #{beer.abv}, #{beer.brewery.name} #{beer.brewery.url}"}
  options_reminder
  user_account_loop
  end
end

def modify_beer_list_options
  add_beer_icons
  puts "Please type '1' to add a beer to your beer list"
  puts "Please type '2' to delete a beer from your beer list"
  puts "Please type '3' to delete all beers from your beer list"
  add_beer_icons
end

def modify_beer_list
  modify_beer_list_options
  puts "Type here:"
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
  $user.reload
  add_beer_icons
  puts "Please type the name of the beer you want to add to your beer list"
  user_input = gets.chomp
  beer = Beer.find_by(name: user_input)
  if beer
    if $user.beers.include?(beer)
      puts "That beer is already in your list amigo, ease off beer, eh?"
      options_reminder
      user_account_loop
    else
      UserBeer.create(user_id: $user.id, beer_id: beer.id)
      add_beer_icons
      puts "#{beer.name} was added to your beer list"
      options_reminder
      user_account_loop
    end
  else
    input_not_found
    user_account_loop
  end
  $user.reload
end

def delete_beer_from_beer_list
  $user.reload
  add_beer_icons
  if $user.beers.length == 0
    puts "Your beer list is empty, silly!"
    options_reminder
    user_account_loop
  else
    puts "Please type the name of the beer you want to remove from your beer list"
    user_input = gets.chomp
    beer = Beer.find_by(name: user_input)
    if !$user.beers.include?(beer)
      add_beer_icons
      puts "That beer is not in your list amigo, ease off the beer, eh?"
      options_reminder
      user_account_loop
    else
    UserBeer.where(user_id: $user.id, beer_id: beer.id).destroy_all
    add_beer_icons
    puts "#{beer.name} was removed from your beer list"
    options_reminder
    user_account_loop
  end
  end
  $user.reload
end

def delete_entire_beer_list
  $user.reload
  if $user.beers.length == 0
    add_beer_icons
    puts "Your beer list is empty, silly!"
    options_reminder
    user_account_loop
  else
    add_beer_icons
    puts "Are you sure? Type 'ClearMeBeerMe' to proceed, otherwise press enter to cancel"
    user_input = gets.chomp.downcase
    if user_input == "clearmebeerme"
      UserBeer.where(user_id: $user.id).destroy_all
      add_beer_icons
      puts "Oh the humanity..."
      options_reminder
      user_account_loop
    else
      options_reminder
      user_account_loop
    end
  end
  $user.reload
end

def delete_account
  add_beer_icons
  puts "Are you sure? Type 'SoberMeUp' to confirm"
  user_input = gets.chomp.downcase
  if user_input == "sobermeup"
    add_beer_icons
    puts "Last chance, buddy, your liver might be happy, but will you be?"
    puts "Type 'MyDrinkingHasDestroyedMyLifeYesIAmSure' if you really don't love us any more"
    user_input2 = gets.chomp.downcase
    if user_input2 == "mydrinkinghasdestroyedmylifeyesiamsure"
      UserBeer.where(user_id: $user.id).destroy_all
      User.find_by(name: $user.name).destroy
      add_beer_icons
      puts "'Hic'.... More beer for us loser!"
      add_beer_icons
      puts "Press enter to continue"
      gets.chomp
    log_in
    end
  else
    puts "You won't regret it (your liver might though....)"
    options_reminder
    user_account_loop
  end
end
