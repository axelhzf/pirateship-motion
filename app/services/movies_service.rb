class MoviesService

  def self.list &block
    AFMotion::JSON.get("#{Settings::endpoint}/api/movies/featured") do |result|
      if result.success?
        movies = result.object.map do |json|
          Movie.new(json)
        end
        block.call(movies)
      elsif result.failure?
        block.call([])
      end
    end
  end

  def self.downloadMagnet magnet, &block
    url = "#{Settings::endpoint}/api/download"
    AFMotion::JSON.get(url, magnet: magnet) do |result|
      err = nil
      if result.failure?
        err = result.error.localizedDescription
      end
      block.call(err)
    end
  end

end