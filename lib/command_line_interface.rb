def welcome
  puts "Welcome to BeerMe, oh seeker of beer and all its attendant delights!"
end

def login_prompt
  puts "Please enter your user name"
  gets.chomp.downcase
end

def list_beer_styles
  Style.all.map do |s|
    "#{s.name} (catalogue number: #{s.id})"
  end
end

def beer_me
  random_beer = Beer.all.sample
  "Too lazy (or drunk) to choose your own beer? No problem! Why don't you try the #{random_beer.name} made by #{random_beer.brewery.name}? With an ABV of #{random_beer.abv}, it's sure to warm your cockles (if that's your thing)!"
end
