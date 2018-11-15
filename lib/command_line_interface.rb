def welcome
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
end


def login_prompt
  puts "Please enter your user name"
  gets.chomp.downcase
end


def brewery_search_request_help
  puts "Type '1' to search by Brewery Name"
  puts  "Type '2' to search by your location" 
  puts "Type '3' to search  by a new Location"
end

def brewery_search_request_test(user_input)

  case brew
    if brewery_search_request = 1
        Brewery.find_by(name)
end

