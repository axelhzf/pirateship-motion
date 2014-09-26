class PirateshipService

  def self.movies &block
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


  def self.find query, &block
    AFMotion::JSON.get("#{Settings::endpoint}/api/find/#{query}") do |result|
      if result.success?
        torrents = result.object["torrents"].map do |json|
          Torrent.new(json)
        end
        block.call(torrents)
      elsif result.failure?
        block.call([])
      end
    end
  end

end