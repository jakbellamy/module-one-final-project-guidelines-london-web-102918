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
