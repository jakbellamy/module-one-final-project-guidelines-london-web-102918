#----USER METHODS----

# user sees the general welcome message, gets prompted to log in or create new user

# log in asks for name or email and validates input
# if no record found suggest checking spelling or creating a new account
# if user found asks for password
# gem to star out password entry https://stackoverflow.com/questions/2338889/how-to-hide-password-input-from-terminal-in-ruby-script
# if password is correct goes to main menu
# if not correct suggest checking spelling or creating a new account

# create account asks for user name, email and password
# once account created goes to main menu

# personalised welcome
# main menu options now including including log out option which re-runs the whole file

 $user = "user"

def log_in
  add_beer_icons
  puts "Please type '1' to log in or '2' to create a new account"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  if user_input == "1"
    existing_user_log_in
  elsif user_input == "2"
    create_new_account
  else log_in
  end
end

def existing_user_log_in
  add_beer_icons
  puts "Please type '1' to log in with your name or '2' to log in with your email address"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  if user_input == "1"
    existing_user_log_in_with_name
  elsif user_input == "2"
    existing_user_log_in_with_email
  else existing_user_log_in
  end
end

def existing_user_log_in_with_name
  add_beer_icons
  puts "Please enter your name"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  $user = User.find_by(name: user_input)
  authenticate
end

def existing_user_log_in_with_email
  add_beer_icons
  puts "Please enter your email address"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  $user = User.find_by(email: user_input)
  authenticate
end

def authenticate
  add_beer_icons
  puts "Welcome #{$user.name}, please enter your password"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  if user_input == $user.password
    main_menu_options
  else authenticate
  end
end

def create_new_account
  add_beer_icons
  puts "Please enter your name"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  $user = User.create(name: user_input)
  create_password
end

def create_password
  add_beer_icons
  puts "Please enter your new password"
  add_beer_icons
  user_input = gets.chomp
  puts ""
  $user.password = user_input
  add_beer_icons
  puts "Welcome to beer me #{$user.name}!"
  add_beer_icons
  main_menu_options
end
