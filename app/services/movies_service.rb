class MoviesService

  def self.list &block
    AFMotion::JSON.get("https://yts.re/api/list.json") do |result|
      movieList = result.object["MovieList"]
      movies = movieList.map do |json|
        Movie.new(json)
      end
      block.call(movies)
    end
  end

end