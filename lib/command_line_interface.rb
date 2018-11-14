def welcome
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
end


def login_prompt
  puts "Please enter your user name"
  gets.chomp.downcase
end

def get_user_input
  gets.strip
end

def invalid_input
  puts "Please enter a valid command"
end

def find_beer
  beer_search_options
  get_user_input

  case get_user_input
  when 1
    beer_by_name
  when 2
    beer_by_brewery
  when 3
    beer_by_abv
  when 4
    beer_by__style
  else
    invalid_input
  end
end

def beer_search_options
  puts "Please type '1' to search by name"
  puts "Please type '2' to search by brewery"
  puts "Please type '3' to search by abv"
  puts "Please type '4' to search by style"
end

def beer_by_name
  user_input = get_user_input
  beer = Beer.find_by(name: user_input)
  puts "#{beer.name} is a #{beer.style} made by #{beer.brewery}, with an abv of #{beer.abv}"
end

def beer_by_brewery
  user_input = get_user_input
  Beer.find_by(name: user_input)
end

def beer_by_abv
  user_input = get_user_input
  Beer.find_by(abv: user_input)
end

def beer_by_style
  user_input = get_user_input
  Beer.find_by(style: user_input)
end
