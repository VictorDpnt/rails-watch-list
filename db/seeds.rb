require "open-uri"
require "json"

url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
data = JSON.parse(response)



data["results"].each do |movie|
  Movie.create(title: movie["title"], overview: movie["overview"] , poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}", rating: movie["vote_average"])
end
