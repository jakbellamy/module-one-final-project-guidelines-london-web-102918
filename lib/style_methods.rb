#----STYLES----

def list_beer_styles
  add_beer_icons
  Style.all.map do |s|
  puts "#{s.name} (catalogue number: #{s.id})"
  end
  further_style_options
end

# def list_styles_in_tens
#   list_beer_styles.first(10)
#   list_beer_styles.
# end

def further_style_options_prompt
  puts "What you like to do now that you have mastered style"
  puts "(at least, in terms of beers...)?"
  puts "Please type '1' to search beers by style"
  puts "Please type '2' to search beers by style catalogue number"
  puts "Alternatively, please type 'main' to return to the Main Menu"
  puts "Or 'log out' to, you guessed it, log out!"
end

def further_style_options
  further_style_options_prompt
  puts "Type here:"
  user_input = gets.chomp
  puts ""
  case user_input
  when "1"
    beer_by_style
  when "2"
    beer_by_style_id
  when "main"
    main_menu_options
  when "log out"
    log_out
  else
    invalid_input
  end
  options_reminder
  further_style_options
end
