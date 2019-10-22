# Start by writing a Sinatra application that has an index and a show route:

# On GET to /members display a list of member names, which are stored in a file members.txt.
# On GET to /members/:name display a details page for this member (i.e. just show their name).

require 'sinatra'
require 'pry'

get '/members' do
  File.open("names.txt").each do |name|
    puts name
  end
end

get '/members/:member' do
  clean_array    = []
  contents_array = File.open("names.txt").to_a

  contents_array.each do |item|
    clean_array << item.gsub("\n", "").downcase
  end

  check = clean_array.include?(params[:member])

  if check
    params[:member]
  else
    "I couldn't find the name"
  end
end

