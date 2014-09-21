class MoviesService

  def self.list &block
    movies = [
        {
            "title" => "The Social Network",
            "year" => 2010,
            "trailer" => "http://youtube.com/watch?v=2RB3edZyeYw",
            "tagline" => "You don't get to 500 million friends without making a few enemies.",
            "overview" => 'On a fall night in 2003, Harvard undergrad and computer programming genius Mark Zuckerberg sits down at his computer and heatedly begins working on a new idea. In a fury of blogging and programming, what begins in his dorm room as a small site among friends soon becomes a global social network and a revolution in communication. A mere six years and 500 million friends later, Mark Zuckerberg is the youngest billionaire in history... but for this entrepreneur, success leads to both personal and legal complications.',
            "poster" => 'http://slurm.trakt.us/images/posters_movies/60.3.jpg',
            "rating" => 78,
            "genres" => ['Drama']
        }
    ]

    movies = movies.map do |json|
      Movie.new(json)
    end

    block.call(movies)


    # AFMotion::JSON.get("https://yts.re/api/list.json") do |result|
    #   movieList = result.object["MovieList"]
    #   movies = movieList.map do |json|
    #     Movie.new(json)
    #   end
    #   block.call(movies)
    # end
  end

  def self.downloadMagnet magnet, &block
    url = "#{Settings::endpoint}/api/download/#{magnet}"
    AFMotion::JSON.get(url) do |result|
      err = nil
      if result.failure?
        err = result.error.localizedDescription
      end
      block.call(err)
    end
  end

end