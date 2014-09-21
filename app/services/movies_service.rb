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

  def self.downloadMagnet magnet, &block
    url = "#{Settings::endpoint}/api/download/#{magnet}"
    puts url
    AFMotion::JSON.get(url) do |result|
      puts result

      err = nil
      if result.failure?
        err = result.error.localizedDescription
      end
      block.call(err)
    end
  end

end