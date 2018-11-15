#----BREWERY METHODS----

def brewery_search_options
  puts "Type '1' to search by Brewery Name"
  puts "Type '2' to search by your location"
  puts "Type '3' to search  by a new location"
end


def find_brewery
    brewery_search_options
    # case brew
    # when brewery_search_request == 1
    #         Brewery.find_by(name)
    # end
end




#----KENAN PRIVATE METHODS----

def get_user_input
  gets.chomp
end