class PirateshipService

  def self.instance
    Dispatch.once { @instance ||= new }
    @instance
  end

  def movies(&block)
    self.get("api/movies/featured") do |err, response|
      if err != nil
        block.call(err)
      else
        movies = response.map { |movie| Movie.new(movie) }
        block.call(nil, movies)
      end
    end
  end

  def download(magnet, &block)
    self.get("api/download", :magnet => magnet) do |err, response|
      block.call(err)
    end
  end

  def find(query, &block)
    self.get("api/find/#{query}") do |err, result|
      if err != nil
        block.call(err)
      else
        torrents = result['torrents'].map {|torrent| Torrent.new(torrent)}
        block.call(nil, torrents)
      end
    end
  end

  def get(path, params = {}, &block)
    AFMotion::JSON.get("#{Settings::endpoint}/#{path}", params) do |result|
      if result.success?
        block.call(nil, result.object)
      elsif result.failure?
        err = result.error.localizedDescription
        block.call(err, nil)
      end
    end
  end

end